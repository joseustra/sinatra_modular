class Routes
  def all
    {
      "/" => HomeController,
      "/javascripts" => AssetsController,
      "/stylesheets" => AssetsController
    }
  end
end
