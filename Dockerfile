
# Use the official Golang base image
FROM golang:1.21-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code into the container
COPY . .

# Build the Go application
RUN go build -o main .


# Command to run the executable
CMD ["./main"]
