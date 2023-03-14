### A Pluto.jl notebook ###
# v0.19.22

#> [frontmatter]
#> chapter = 1
#> section = 2
#> order = 8
#> title = "冒泡顺序"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "CH01"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 2a251030-bc90-11ed-14f2-d12043ef0a37
md"""
- ctrl + m: 把当前cell变成markdown
- ctrl + enter: 新的cell （mac：commant+enter）
- shift + enter: 运行当前cell
- (shift +) tab： 代码缩进
- contrl（command） + /: 把当前cell中的代码注释掉

$\frac{\alpha}{\beta}$

#### 函数定义方式

- `x -> f(x)`

"""

# ╔═╡ 237b2699-4647-4a6b-8ea6-1f4c11ee061a
using BenchmarkTools

# ╔═╡ 4c5666b4-b721-481c-b9b8-e10debf73ccb
# ╠═╡ disabled = true
#=╠═╡
z = collect(1:10)
  ╠═╡ =#

# ╔═╡ df5c2d6f-07d1-4695-a882-184bd4238460
(x -> x^2)(z) # dot syntax

# ╔═╡ 89843663-6983-4443-bc09-d3670751cac2
# @doc map

# ╔═╡ a096b9e9-6972-4077-94e7-11e4ffc293ca
map(z) do x
	y = x^2
	y + 100
end

# ╔═╡ 9701f09a-db0c-4de4-a3c0-85e8c5aabc61
map(x->(y = x^2; y + 100), z)

# ╔═╡ 37e2bc11-dfae-4c48-9dea-275586f54703
f(x) = (y = x^2; return y + 100)

# ╔═╡ b17663a9-90d6-429b-b8d9-ac81249e24f6
map(f, z)

# ╔═╡ ed0da3d4-a323-49ae-8e29-9902a9f32151
function ff(x)
	return y = x^2
	y + 100
end

# ╔═╡ 7b61e179-26e6-4907-a840-57146240c95f
map(ff, z)

# ╔═╡ fe1df083-7d2a-4dc7-b378-2d2e9fcf1cd1
ff(4)

# ╔═╡ f0284138-80fe-437e-89d0-08b528108389
ff(z)

# ╔═╡ a092779d-18f0-4140-a125-e84135953277
ff.(z)

# ╔═╡ 0af2aeef-c07d-45ca-aef5-4ba142f9d4d5
md"""
#### 运行速度问题
"""

# ╔═╡ 4efba926-216c-4045-afd5-8f72812ea989
begin # let vs begin
	n, a = 100_000, 2.78
	x, y = rand(n), rand(n)
end

# ╔═╡ e8b5d14e-d576-4d9c-8773-323499bde96a
z = []

# ╔═╡ bf3e1604-8484-4796-8516-8dd7aefbc44c
typeof(z)

# ╔═╡ 139f9c28-29c4-436e-82e5-3d7fca30e080
# z1 = Vector{Float64}(undef, length(x))

# ╔═╡ 5aa2f9f8-1fed-4bef-b8f1-14cf444bb44b
@time for i in 1:n
	temp = a * x[i] + y[i]
	push!(z, temp) # 所有带叹号的函数都存在其某个参数会被改变的情况。
end

# ╔═╡ 602b6fea-868a-45ed-847e-96aaf4c938b6
z

# ╔═╡ 21f3a2f9-dd49-4585-b763-d32609f75c40
function axpy1(a, x, y)
	z = []
	for i in 1:n
		temp = a * x[i] + y[i]
		push!(z, temp) # 所有带叹号的函数都存在其某个参数会被改变的情况。
	end
end

# ╔═╡ bc26ccd8-16fa-46b4-a636-023fddb6765e
@benchmark axpy1(a, x, y)

# ╔═╡ 6b6fab66-89b1-4b92-96bf-eefc21e53e8e
function axpy2(a, x, y)
	z = Vector{Float64}(undef, length(x))
	for i in 1:n
		temp = a * x[i] + y[i]
		push!(z, temp) # 所有带叹号的函数都存在其某个参数会被改变的情况。
	end
end

# ╔═╡ 5149fcc0-bc41-491f-8ab8-54b4d9b9ed08
@benchmark axpy2(a, x, y)

# ╔═╡ 8502b9fa-c80d-4d86-a9ca-6a71c9b592d9
md"""
### 冒泡顺序
"""

# ╔═╡ e0ccdcab-b87d-4cea-be8b-ffbdc6ab06a2
function bubbleSort!(a)
	n = length(a)
	for i in 1:n-1
		for j in 1:n-i
			if a[j] > a[j+1]
				a[j], a[j+1] = a[j+1], a[j]
			end
		end
	end
	return a
end

# ╔═╡ 68434737-6462-49fa-bfcf-36577356b993
data = rand(1:1000, 10^4)

# ╔═╡ eac7e16b-60ac-4f4b-afda-88fc4e08f710
@time bubbleSort!(data)

# ╔═╡ 3028a22b-2f13-44ab-9844-efe9de970fa9
@time sort!(data)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"

[compat]
BenchmarkTools = "~1.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "cdb03a69499471ffe0f32a9f377a6fd82c192b6f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "d9a9701b899b30332bbcb3e1679c41cce81fb0e8"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.3.2"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "478ac6c952fddd4399e71d4779797c538d0ff2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.8"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═2a251030-bc90-11ed-14f2-d12043ef0a37
# ╠═237b2699-4647-4a6b-8ea6-1f4c11ee061a
# ╠═4c5666b4-b721-481c-b9b8-e10debf73ccb
# ╠═df5c2d6f-07d1-4695-a882-184bd4238460
# ╠═89843663-6983-4443-bc09-d3670751cac2
# ╠═a096b9e9-6972-4077-94e7-11e4ffc293ca
# ╠═9701f09a-db0c-4de4-a3c0-85e8c5aabc61
# ╠═37e2bc11-dfae-4c48-9dea-275586f54703
# ╠═b17663a9-90d6-429b-b8d9-ac81249e24f6
# ╠═ed0da3d4-a323-49ae-8e29-9902a9f32151
# ╠═7b61e179-26e6-4907-a840-57146240c95f
# ╠═fe1df083-7d2a-4dc7-b378-2d2e9fcf1cd1
# ╠═f0284138-80fe-437e-89d0-08b528108389
# ╠═a092779d-18f0-4140-a125-e84135953277
# ╠═0af2aeef-c07d-45ca-aef5-4ba142f9d4d5
# ╠═4efba926-216c-4045-afd5-8f72812ea989
# ╠═e8b5d14e-d576-4d9c-8773-323499bde96a
# ╠═bf3e1604-8484-4796-8516-8dd7aefbc44c
# ╠═139f9c28-29c4-436e-82e5-3d7fca30e080
# ╠═5aa2f9f8-1fed-4bef-b8f1-14cf444bb44b
# ╠═602b6fea-868a-45ed-847e-96aaf4c938b6
# ╠═21f3a2f9-dd49-4585-b763-d32609f75c40
# ╠═bc26ccd8-16fa-46b4-a636-023fddb6765e
# ╠═6b6fab66-89b1-4b92-96bf-eefc21e53e8e
# ╠═5149fcc0-bc41-491f-8ab8-54b4d9b9ed08
# ╠═8502b9fa-c80d-4d86-a9ca-6a71c9b592d9
# ╠═e0ccdcab-b87d-4cea-be8b-ffbdc6ab06a2
# ╠═68434737-6462-49fa-bfcf-36577356b993
# ╠═eac7e16b-60ac-4f4b-afda-88fc4e08f710
# ╠═3028a22b-2f13-44ab-9844-efe9de970fa9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
