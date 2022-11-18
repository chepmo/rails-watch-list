class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)

    if @list.save
      redirect_to list_path(@list), notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def params_list
    params.require(:list).permit(:name)
  end


end
