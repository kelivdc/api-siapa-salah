class CategoryBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :slug, :sort, :publish
end
