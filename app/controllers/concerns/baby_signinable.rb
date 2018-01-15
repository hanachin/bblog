module BabySigninable
  def signin(baby)
    session[:baby_id] = baby.id
  end
end
