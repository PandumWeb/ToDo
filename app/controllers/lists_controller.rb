class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    if params[:search]
      @lists = List.search(params[:search]).paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
    else
      @lists = List.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
 
  end

  # GET /lists/new
  def new
    @list = List.new
  end


  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.build(params[:list].permit(:title, :description))

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Liste créée avec succès.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Liste modifiée avec succes' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Liste supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title)
    end
end
