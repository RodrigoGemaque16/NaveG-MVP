class AdminsBackoffice::UsersController < AdminsBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_user, only: [:update,:edit]
  def index
    @users = User.all.page params[:page]
  end
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:success] = "Object successfully created"
      
      redirect_to admins_backoffice_users_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end  
  

  def edit; end
  def update
    if @user.update(params_user)
        redirect_to admins_backoffice_users_path, notice: "Usuario atualizado com sucesso!"
        else
          render :edit
      end
  end
  def destroy 
    set_user
    if @user.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_users_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end



private
  def params_user
      params.require(:user).permit(:email, :password,:password_confirmation)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password,:password_confirmation)
    end   
  end

  def set_user 
    @user = User.find(params[:id])
  end



end
