module ProgramsHelper
  def program_capacity(program)
    program.maximum_participants || "Unlimited"
  end
end
