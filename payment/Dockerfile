# Use the official Ruby image
FROM ruby:3.2

# Set the working directory
WORKDIR /app

# Copy the Gemfile and install dependencies
COPY Gemfile ./
RUN bundle install

# Copy the application code
COPY . .

# Expose the port Sinatra runs on by default
EXPOSE 4567

# Command to run the application using the ruby interpreter
CMD ["ruby", "app.rb"]
