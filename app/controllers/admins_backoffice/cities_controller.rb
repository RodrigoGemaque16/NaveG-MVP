class AdminsBackoffice::CitiesController < AdminsBackofficeController
  before_action :verify_fields, only: [:update]
  before_action :set_city , only: [:update,:edit]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params_city)
    if @city.save
      flash[:success] = "Object successfully created"
      
      redirect_to admins_backoffice_cities_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end  


  def edit; end
  def update
    if @city.update(params_city)
        redirect_to admins_backoffice_cities_path, notice: "Usuario atualizado com sucesso!"
        else
          render :edit
      end
  end


  def destroy 
    set_city
    if @city.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_cities_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end

  private
  def params_city
      params.require(:city).permit(:name, :city,:state)
  end

  def verify_fields
    if params[:city][:name].blank? && params[:city][:city].blank? && params[:city][:state].blank?
      params[:city].extract!(:name,:city,:state)
    end   
  end

  def set_city 
    @city = City.find(params[:id])
  end  

end
