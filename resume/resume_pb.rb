# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: resume.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("resume.proto", :syntax => :proto3) do
    add_message "Name" do
      optional :name, :string, 1
    end
    add_message "Job" do
      optional :field, :string, 1
      optional :role, :string, 2
      optional :experience, :int32, 3
    end
    add_message "Interests" do
      repeated :areas, :string, 1
    end
    add_message "Skills" do
      repeated :skills, :string, 1
    end
    add_message "ProgrammingLanguages" do
      repeated :languages, :string, 1
    end
  end
end

Name = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Name").msgclass
Job = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Job").msgclass
Interests = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Interests").msgclass
Skills = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Skills").msgclass
ProgrammingLanguages = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("ProgrammingLanguages").msgclass
