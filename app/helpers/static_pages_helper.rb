module StaticPagesHelper
  def about
    @user = Users.all.find(param(:id))
  end
end
