# resume_client.rb

this_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(this_dir) unless $LOAD_PATH.include?(this_dir)

require 'resume_services_pb'

def main
  user = 'Pai'
  name = Name.new(name: user)
  stub = Details::Stub.new('localhost:50051', :this_channel_is_insecure)
  begin
    job = stub.get_job(name)
    puts "Job Field: #{job.field}"
    puts "Job Role: #{job.role}"
    puts "Job Experience: #{job.experience} years"
    interests = stub.get_interests(name)
    puts "Interests: #{interests.areas}"
    skills = stub.get_skills(name)
    puts "Skills: #{skills.skills}"
    prog_lang = stub.get_programming_languages(name)
    puts "Programming Languages: #{prog_lang.languages}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
