import pika
import sys
import threading
import time

class Chat():
    
    def __init__(self, name=None):
        self._name = name
        self._connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
        self._channel = self._connection.channel()
        self._channel.queue_declare(queue=name)
        self.consume()

    
    def envio_msg(self, routing_key : str, message : str):
        self._channel.basic_publish(
            exchange='', routing_key=routing_key, body=message)
    
    @property
    def close(self):
        return self._connection.close()

    def callback(self, ch, method, properties, body):
        print(" [x] Received %r" % body)
        time.sleep(body.count('.'))
        ch.basic_ack(delivery_tag=method.delivery_tag)

    @property
    def consumer(self):
        self._channel.basic_consume(
            queue=self._name, on_message_callback=self.callback, auto_ack=True)
        self._channel.start_consuming()
 






def main():
    name : str = input()
    chat = Chat(name=name)
    
    # Pass in the kwargs
    kwargs = {'connection': connection}

    # Start the consumer thread
    consumer_thread = threading.Thread(target=consumer, kwargs=kwargs)
    consumer_thread.start()

    # Start the pubisher thread
    publisher_thread = threading.Thread(target=publisher, kwargs=kwargs)
    publisher_thread.start()

    # Join the consumer thread, waiting for it to consume all MESSAGE_COUNT messages
    consumer_thread.join()


    while mensage != "exit":
        mensage = input()
        chat.envio_msg(routing_key=name, message=mensage)


    chat.close



if __name__ == "__main__":
    main()






