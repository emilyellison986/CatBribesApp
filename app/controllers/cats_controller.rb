class CatsController < ApplicationController
  
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new(params[:cat])
    if @cat.save 
      redirect_to member_url(@current_member.id), notice: "#{@cat.name} has been added to your profile!"
    else
      render :new
    end
  end
  
  def show
    @cat = Cat.find_by_id(params[:id])
  end
  
  def edit
    @cat = Cat.find_by_id(params[:id])
  end
  
  def update
    @cat = Cat.find_by_id(params[:id])
    @cat.update_attributes(params[:cat])
    if @cat.save
      redirect_to member_url(@current_member.id), notice: "#{@cat.name} has been updated sucessfully."
    else
      render :edit
    end
  end
  
  def destroy
    @cat = Cat.find_by_id(params[:id])
    @cat.destroy
  end
  
end