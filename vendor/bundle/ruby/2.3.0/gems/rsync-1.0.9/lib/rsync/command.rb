module Rsync
  # An rsync command to be run
  class Command
    # Runs the rsync job and returns the results
    #
    # @param args {Array}
    # @return {Result}
    def self.run(*args)
      output = run_command("rsync --itemize-changes #{args.join(" ")}")
      Result.new(output, $?.exitstatus)
    end

private

    def self.run_command(cmd, &block)
      if block_given?
        IO.popen("#{cmd} 2>&1", &block)
      else
        `#{cmd} 2>&1`
      end
    end
  end
end
