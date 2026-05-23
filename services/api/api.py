from fastapi import FastAPI
import grpc
import worker_pb2
import worker_pb2_grpc

app = FastAPI()

WORKERS = [
    "10.0.2.10:50051",
    "10.0.2.11:50051",
    "10.0.2.12:50051"
]

@app.post("/infer")
def infer(data: dict):
    value = data["input"]

    results = []
    for w in WORKERS:
        channel = grpc.insecure_channel(w)
        stub = worker_pb2_grpc.WorkerStub(channel)
        res = stub.Infer(worker_pb2.Request(input=value))
        results.append(res.result)

    return {"result": sum(results)}