### Hi there 👋

<!--
**slashpai/slashpai** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

-->

- 🔭 I’m currently working on cloud platform engineering...
- 🌱 I’m currently learning full stack web development, building API's using gRPC ...
- 💬 Ask me about programming, cloud engineering and devops tools..

    ```proto
    syntax = "proto3";

    message Name {
        string name = 1;
    }

    message Job {
        string field = 1;
        string role = 2;
        int32 experience = 3;
    }

    message Interests {
        repeated string areas = 1;
    }

    message Skills {
        repeated string skills = 1;
    }

    message ProgrammingLanguages {
        repeated string languages = 1;
    }

    service Details {
        rpc getJob(Name) returns (Job) {}
        rpc getInterests(Name) returns (Interests) {}
        rpc getSkills(Name) returns (Skills) {}
        rpc getProgrammingLanguages(Name) returns (ProgrammingLanguages) {}
    }
    ```

   ```ruby
   grpc_tools_ruby_protoc -I resume --ruby_out resume --grpc_out resume resume/resume.proto
   ```

    ```ruby
    # resume_server.rb

    this_dir = File.expand_path(File.dirname(__FILE__))
    $LOAD_PATH.unshift(this_dir) unless $LOAD_PATH.include?(this_dir)

    require 'resume_services_pb'

    class ResumeServer < Details::Service
      def get_job(job_req, _unused_call)
        p "Received #{job_req} from client rpc call get_job()"
        Job.new(field: 'Cloud Operations', role: 'Senior System Engineer', experience: 7)
      end

        def get_interests(int_req, _unused_call)
          p "Received #{int_req} from client rpc call get_interests()"
          Interests.new(areas: ['Programming', 'Distributed Computing', 'Designing Micro Services', 'Cloud Computing', 'Full Stack Web Development', 'Machine Learning'])
        end

        def get_skills(skill_req, _unused_call)
          p "Received #{skill_req} from client rpc call get_skills()"
          Skills.new(skills: %w[Linux Hadoop Docker Kubernetes Chef Ansible Consul Terraform Openstack AWS Jenkins Zabbix Splunk Prometheus Grafana NewRelic git protobuf gRPC Selenium])
        end

        def get_programming_languages(prog_lang_req, _unused_call)
          p "Received #{prog_lang_req} from client rpc call get_programming_languages()"
          ProgrammingLanguages.new(languages: %w[C C++ Java Python Groovy Ruby Go Shell Scripting JavaScript])
        end
    end

    def main
      s = GRPC::RpcServer.new
      s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
      s.handle(ResumeServer)
      s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
    end

  main
  ```

  ```ruby
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
  ```

  ```ruby
  slashpai@pai  ~/github/myrepo/slashpai   master ✚  ruby resume/resume_server.rb
  "Received <Name: name: \"Pai\"> from client rpc call get_job()"
  "Received <Name: name: \"Pai\"> from client rpc call get_interests()"
  "Received <Name: name: \"Pai\"> from client rpc call get_skills()"
  "Received <Name: name: \"Pai\"> from client rpc call get_programming_languages()"
  ```

  ```ruby
  slashpai@pai  ~/github/myrepo/slashpai   master ●  ruby resume/resume_client.rb
  Job Field: Cloud Operations
  Job Role: Senior System Engineer
  Job Experience: 7 years
  Interests: ["Programming", "Distributed Computing", "Designing Micro Services", "Cloud Computing", "Full Stack Web Development", "Machine Learning"]
  Skills: ["Linux", "Hadoop", "Docker", "Kubernetes", "Chef", "Ansible", "Consul", "Terraform", "Openstack", "AWS", "Jenkins", "Zabbix", "Splunk", "Prometheus", "Grafana", "NewRelic", "git", "protobuf", "gRPC", "Selenium"]
  Programming Languages: ["C", "C++", "Java", "Python", "Groovy", "Ruby", "Go", "Shell", "Scripting", "JavaScript"]
  ```
