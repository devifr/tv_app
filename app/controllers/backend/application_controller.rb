class Backend::ApplicationController < ApplicationController
  before_filter :authenticate_admin!
end