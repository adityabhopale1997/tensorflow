#!/bin/bash
# run_benchmark.sh - Run a basic TensorFlow performance test

echo "Running TensorFlow benchmark..."

python3 - <<EOF
import time
import tensorflow as tf

model = tf.keras.Sequential([
    tf.keras.layers.Dense(512, activation='relu', input_shape=(1000,)),
    tf.keras.layers.Dense(10)
])

data = tf.random.uniform((1000, 1000))
labels = tf.random.uniform((1000, 10))

model.compile(optimizer='adam', loss='mse')
start = time.time()
model.fit(data, labels, epochs=5, verbose=0)
end = time.time()

print(f"Training completed in {end - start:.2f} seconds")
EOF