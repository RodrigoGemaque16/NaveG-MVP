class AdminsBackoffice::HarborsController < AdminsBackofficeController
  before_action :verify_fields, only: [:update]
  before_action :set_harbor, only: [:update,:edit]
  before_action :get_cities , only: [:edit, :new]

  def index
    @harbors = Harbor.includes(:city).order(:name )
  end

  def new
    @harbor = Harbor.new
  end

  def create
    @harbor = Harbor.new(params_harbor)
    if @harbor.save
      flash[:success] = "Object successfully created"      
      redirect_to admins_backoffice_harbors_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end  


  def edit; end
  def update
    if @harbor.update(params_harbor)
        redirect_to admins_backoffice_harbors_path, notice: "Usuario atualizado com sucesso!"
        else
          render :edit
      end
  end


  def destroy 
    set_harbor
    if @harbor.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_harbors_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end

  private
  def params_harbor
      params.require(:harbor).permit(:name, :city_id,:state)
  end

  def verify_fields
    if params[:harbor][:name].blank? && params[:harbor][:city].blank? && params[:harbor][:state].blank?
      params[:harbor].extract!(:name,:city,:state)
    end   
  end

  def get_cities
    @cities = City.all
  end
  def set_harbor 
    @harbor = Harbor.find(params[:id])
  end  

end
