class ItemsController < ApplicationController
	before_action :set_list
	before_action :set_item, except: [:create]

	def create
		@item = @list.items.create(items_params)
		redirect_to @list
	end

	def destroy
		@item = @list.items.find(params[:id])
		if @item.destroy
			flash[:success] = "La tâche a été supprimée."
		else 
			flash[:error] = "ILa tâche ne peut être supprimée"
		end
		redirect_to @list
	end

	def complete
		@item.update_attribute(:completed_at, Time.now)
		redirect_to @list, notice: "Tâche effectuée"
	end

	def put
		@item.update_attribute(:puted_at, Time.now)
		redirect_to @list, notice: "Item puted"
	end

	private

	def set_list
		@list = List.find(params[:list_id])
	end

	def set_item
		@item = @list.items.find(params[:id])
	end

	def items_params
		params.require(:item).permit(:content)
	end
end
