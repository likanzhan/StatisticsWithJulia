### A Pluto.jl notebook ###
# v0.19.22

#> [frontmatter]
#> chapter = 1
#> section = 1
#> order = 7
#> title = "函数定义"
#> layout = "layout.jlhtml"
#> description = ""
#> tags = ["lecture", "Ch01"]

using Markdown
using InteractiveUtils

# ╔═╡ f4cd6832-b715-11ed-24bb-050badf4eed8
m = rand(10, 10)

# ╔═╡ 6022d5b7-9568-4833-9fee-7fd019c0449c
md"""

- control + m: 当前cell为文字输入

- $\frac{\alpha}{\beta}\times \Gamma$

"""

# ╔═╡ e59e7b99-333d-4dd5-9b75-35d15f83ec50
世界 = ["world", "地球"]

# ╔═╡ 77ea6786-783d-4105-ae3c-2d69f2520674
println("你好 $世界")

# ╔═╡ 7d881bb2-4a77-4cbf-b77b-ee43983410b2
for (indx, val) in enumerate(世界)
	println(indx)
	println(val)
	println("====")
end

# ╔═╡ a5975b29-bf3c-486d-9cb0-269466d0d1d8
[x^4 for x in 1:10]

# ╔═╡ 186e8b02-5a27-4d93-88f7-a027aeffb3f7
[x^4 * y^4 for x in 1:10 for y in 1:5]

# ╔═╡ b2d3d779-4896-47a8-a3ba-629cf327816d
[x^4 * y^4 for x in 1:10, y in 1:5]

# ╔═╡ 55c3f8db-7bd4-431f-a48e-9ef7c236f6c2
[x^4 * y^4 * z^3 for x in 1:10, y in 1:5, z in 1:4]

# ╔═╡ 93d12393-06dc-42e4-9ca7-25cbf9cd86d5
X = reshape(1:25, 5, :)

# ╔═╡ 1cd12526-ec44-4964-9868-9d16a92afbf5
[x ^ 2 for x in X]

# ╔═╡ 34f65cb8-3031-44ff-a725-73639855fad0
map(x -> x^2, X)

# ╔═╡ db606a0b-b43b-4831-b400-d5d534f6dc1c
map(X) do x
	x^2
end # <=> x -> x^2

# ╔═╡ d3cd6ebe-b878-4193-b14f-6ae72cacf77e
f1(x) = x^2

# ╔═╡ bfca96ff-c47f-4d73-9e50-2d3be3761188
f1(2)

# ╔═╡ b970605a-4b1a-42fd-9ce4-25d34c7c6043
(x -> x^2)(2)

# ╔═╡ a17306b3-a831-4de3-89e3-b23bc51c3a4f
function f2(x)
	return x^2
end

# ╔═╡ 7c8b0991-afc7-477b-87a1-3d908535471b
f2(2)

# ╔═╡ 93b1be56-9738-4ee3-a23f-2a4241a882a5
X .^ 2 # dot syntax

# ╔═╡ Cell order:
# ╠═f4cd6832-b715-11ed-24bb-050badf4eed8
# ╠═6022d5b7-9568-4833-9fee-7fd019c0449c
# ╠═e59e7b99-333d-4dd5-9b75-35d15f83ec50
# ╠═77ea6786-783d-4105-ae3c-2d69f2520674
# ╠═7d881bb2-4a77-4cbf-b77b-ee43983410b2
# ╠═a5975b29-bf3c-486d-9cb0-269466d0d1d8
# ╠═186e8b02-5a27-4d93-88f7-a027aeffb3f7
# ╠═b2d3d779-4896-47a8-a3ba-629cf327816d
# ╠═55c3f8db-7bd4-431f-a48e-9ef7c236f6c2
# ╠═93d12393-06dc-42e4-9ca7-25cbf9cd86d5
# ╠═1cd12526-ec44-4964-9868-9d16a92afbf5
# ╠═34f65cb8-3031-44ff-a725-73639855fad0
# ╠═db606a0b-b43b-4831-b400-d5d534f6dc1c
# ╠═d3cd6ebe-b878-4193-b14f-6ae72cacf77e
# ╠═bfca96ff-c47f-4d73-9e50-2d3be3761188
# ╠═b970605a-4b1a-42fd-9ce4-25d34c7c6043
# ╠═a17306b3-a831-4de3-89e3-b23bc51c3a4f
# ╠═7c8b0991-afc7-477b-87a1-3d908535471b
# ╠═93b1be56-9738-4ee3-a23f-2a4241a882a5
