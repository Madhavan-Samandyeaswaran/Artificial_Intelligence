import tensorflow as tf
from tensorflow.keras import layers, models

# Define the architecture of the neural network
class FeedForwardNN(tf.keras.Model):
    def __init__(self, input_size, hidden_size, output_size):
        super(FeedForwardNN, self).__init__()
        self.flatten = layers.Flatten(input_shape=(input_size,))
        self.hidden_layer = layers.Dense(hidden_size, activation='relu')
        self.output_layer = layers.Dense(output_size, activation='softmax')

    def call(self, inputs):
        x = self.flatten(inputs)
        x = self.hidden_layer(x)
        return self.output_layer(x)

# Example usage
input_size = 784  # Input size for MNIST dataset (28x28 pixels)
hidden_size = 128
output_size = 10  # Number of classes in MNIST dataset

# Create an instance of the model
model = FeedForwardNN(input_size, hidden_size, output_size)

# Build the model by running a forward pass
dummy_input = tf.ones((1, input_size))
_ = model(dummy_input)

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display the model summary
model.summary()
