module SecuredRequest
  extend ActiveSupport::Concern
  
  def is_authenticated
    if !cookies[:user_id]
      redirect_to root_path
    end
  end

  def jwt_encode(args)
    @jwt_encode = JsonWebToken.encode args
  end

  def jwt_decode(args)
    @jwt_decode = JsonWebToken.decode args
  end

  def jwt_token user_id
    @jwt_token = JsonWebToken.encode user_id
  end

  def jwt_time
    @jwt_time = Time.now + 24.hours.to_i
  end

  def jwt_time_formatted
    @jwt_time_formatted = jwt_time.strftime("%m-%d-%Y %H:%M")
  end

  def find_email(email)
    @find_email = User.find_by_email email
  end
end
