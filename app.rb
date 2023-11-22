class App
  def initialize
    @user = User.new
  end

  def start
    @user.login
  end
end
