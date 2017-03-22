class User
  attr_accessor :name, :email

  def initalize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def format_email
    "#{@name} <#{@email}>"
  end

  def full_name

  end

  def alphabetical_name

  end
end