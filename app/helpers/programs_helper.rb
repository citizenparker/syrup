module ProgramsHelper
  def program_capacity(program)
    program.capacity || "Unlimited"
  end
end
