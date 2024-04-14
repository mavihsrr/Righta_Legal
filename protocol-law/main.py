from langchain_community.document_loaders import PyPDFLoader
from langchain_community.vectorstores import FAISS
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_openai.embeddings import OpenAIEmbeddings
import os
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.chains import RetrievalQA
from dotenv import load_dotenv
import tiktoken
from langchain_google_genai import (
    ChatGoogleGenerativeAI,
    HarmBlockThreshold,
    HarmCategory,
)
from langchain_core.messages import HumanMessage, SystemMessage

load_dotenv()


def tiktoken_len(text):
    tokenizer = tiktoken.get_encoding("cl100k_base")
    tokens = tokenizer.encode(text, disallowed_special=())
    return len(tokens)


if __name__ == "__main__":
    # Check if the Faiss index already exists
    index_path = "faiss_index"
    if os.path.exists(index_path):
        # If the index exists, load it
        embeddings = OpenAIEmbeddings()
        loaded_vectorstore = FAISS.load_local(index_path, embeddings, allow_dangerous_deserialization=True)
    else:
        # If the index does not exist, create and save it
        loader = PyPDFLoader(
            "/Users/shivammitter/Desktop/Home/AI/Gen_AI/projects/protocol-law/Bharatiya_Nyaya_Sanhita,_2023.pdf"
        )
        docs = loader.load()
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=100,
            chunk_overlap=20,
            length_function=tiktoken_len,
            separators=["\n\n", "\n"],
        )
        doc_f = text_splitter.split_documents(docs)
        embeddings = OpenAIEmbeddings()
        loaded_vectorstore = FAISS.from_documents(doc_f, embeddings)
        loaded_vectorstore.save_local(index_path)

    generation_config = {
        "temperature": 0.5,
        "top_p": 1,
        "top_k": 1,
        "max_output_tokens": 2048,
    }
    llm = ChatGoogleGenerativeAI(
        model="gemini-pro",
        generation_config=generation_config,
        safety_settings={
            HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: HarmBlockThreshold.BLOCK_NONE,
        },
    )
    

    qa = RetrievalQA.from_chain_type(
        llm=llm, chain_type="stuff", retriever=loaded_vectorstore.as_retriever()
    )

    user_query = input("Please enter your legal query: ")

    prompt = '''You are a legal expert specializing in Indian law. A user seeks your guidance 
    regarding a specific legal situation they are facing. Your task is to provide comprehensive 
    assistance by explaining their situation in legal terms, outlining their rights under 
    Indian law,explaining the relevant laws in the penal code,case laws, and recommending the appropriate 
    course of action. ''' + user_query

    result = qa.invoke({"query": prompt})

    # Print the result
    print("Prompt:", user_query)
    print("Result:")
    print(result["result"])