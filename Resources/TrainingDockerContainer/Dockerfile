FROM tensorflow/tensorflow:1.9.0-devel-gpu
RUN apt-get update && apt-get install -y git nano vim wget
WORKDIR ~/
RUN pip install --upgrade pip
RUN apt-get install -y python3-pip 
RUN apt-get install -y protobuf-compiler python-pil python-lxml python-tk
RUN pip install pillow jupyter matplotlib pandas
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip
RUN pip3 install pandas
RUN pip3 install tensorflow
RUN pip3 install pillow
RUN pip3 install lxml
RUN pip3 install jupyter
RUN pip3 install matplotlib
RUN pip3 install opencv-python
RUN pip3 install tqdm
WORKDIR /tensorflow
RUN git clone https://github.com/tensorflow/models.git
WORKDIR models
WORKDIR research
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip
RUN unzip protoc-3.0.0-linux-x86_64.zip
RUN ./bin/protoc object_detection/protos/*.proto --python_out=.
RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/slim" >> ~/.bashrc
RUN echo "export PYTHONPATH=$PYTHONPATH:/tensorflow/models/research:/tensorflow/models/research/slim" >> ~/.bashrc
RUN python setup.py install
RUN git clone https://github.com/cocodataset/cocoapi.git
WORKDIR cocoapi/PythonAPI 
RUN make
WORKDIR /tensorflow/models/research
RUN cp -r cocoapi/PythonAPI/pycocotools .
