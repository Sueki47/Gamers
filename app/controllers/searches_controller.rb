class SearchesController < ApplicationController
  before_action :authenticate_user!, except: [:search] 

  def search
    @model=params[:model]
    @content=params[:content]
    @method=params[:method]
    if @model == 'user'
      @records=User.search_for(@content,@method)
    else
      @records=Game.search_for(@content,@method)
    end
  end
end
