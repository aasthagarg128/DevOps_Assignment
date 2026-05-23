import grpc
from concurrent import futures
import worker_pb2
import worker_pb2_grpc

class Worker(worker_pb2_grpc.WorkerServicer):
    def Infer(self, request, context):
        return worker_pb2.Response(result=request.input * 2)

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=5))
    worker_pb2_grpc.add_WorkerServicer_to_server(Worker(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()

if __name__ == "__main__":
    serve()