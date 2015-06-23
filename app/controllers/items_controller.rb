class ItemsController < ApplicationController
	before_action :set_list

	def create
		@item = @list.items.create(items_params)
		redirect_to @list
	end

	def destroy
		@item = @list.items.find(params[:id])
		if @item.destroy
			flash[:success] = "Item was deleted."
		else 
			flash[:error] = "Item could not be deleted."
		end
		redirect_to @list
	end

	private

	def set_list
		@list = List.find(params[:list_id])
	end

	def items_params
		params.require(:item).permit(:content)
	end
end
