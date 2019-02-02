

include("dataset.jl")
using Statistics

const lr = 0.000001::Float64
const show_every = 1000::Int64
const epochs = 1000000::Int64

rows, columns = size(DATASET.train)

let
	w = (2.0 .* rand(columns, 1)) .- 1
	for i =1:epochs
		y_pred = DATASET.train * w
		error = target - y_pred
		change = - (transpose(error) * DATASET.train) .* (1.0/rows)
		w = w .- transpose(lr .* change)
		if i % 100 == 0
			println( "Error at ", i, "th Iteration is ", mean((target - y_pred).^2))
		end
	end
end