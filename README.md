# TinyML_Projects
Term projects for Embedded Machine Learning Course, IIT KGP

Please refer to the report for analysis and implementation details.

Link to notebook for sine value prediction: [Sine value prediction](https://colab.research.google.com/drive/1LDg83O-ng1LsrMPvPrJYYEiBhx8QVF27?usp=sharing)

Link to notebook for wake word detection: [Wake word detection](https://colab.research.google.com/drive/1OBVh9HP4d5nKtsJJEYNiv_HhxC-tlJTu?usp=sharing)

Important files for sine value prediction:
1. arduino_output_handler.cpp : Modified output behaviour
2. orig_model_3: Saved model directory for model 3
3. orig_model_5: Saved model directory for model 5
4. sine_model_quantized_3.cc: Cpp file containing converted optimised model 3
5. sine_model_quantized_5.cc: Cpp file containing converted optimised model 5

Important files for wake word detection:
1. arduino_commnd_responder.cpp: Modified output behaviour
2. micro_model_setting.cc: Modified labels of new model
3. models/ : Directory containing original and converted models
4. train/ : Directory containing the training checkpoints

References: 
1. [tflite-micro officialrepo](https://github.com/tensorflow/tflite-micro)
2. Warden, P., & Situnayake, D. (2020). TinyML: Machine Learning with TensorFlow Lite on Arduino and Ultra-low-power Microcontrollers. O'Reilly
