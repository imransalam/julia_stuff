
using DataFrames
using CSV

mutable struct dataset
	train
	val
end

function split_dataframe_in_cols_target(df)
	target = df.medv
	deletecols!(df, :medv)
	return df, target
end

function remove_id_col(df)
	deletecols!(df, :ID)
	return df
end



DATASET = dataset(CSV.read("boston-housing/train.csv"), CSV.read("boston-housing/test.csv"))
DATASET.train, target = split_dataframe_in_cols_target(DATASET.train)
DATASET.train = remove_id_col(DATASET.train)
DATASET.val = remove_id_col(DATASET.val)


DATASET.train = convert(Matrix, DATASET.train)
DATASET.val = convert(Matrix, DATASET.val)