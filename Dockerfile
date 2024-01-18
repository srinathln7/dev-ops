
# Use the official Golang base image
FROM golang:1.21-alpine

ENV PORT="80"

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code into the container
COPY . .


EXPOSE 80

# Build the Go application
RUN go build -o main .


# Command to run the executable
CMD ["./main"]
