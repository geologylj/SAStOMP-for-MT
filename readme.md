# A method for magnetotelluric data processing based on sparsity adaptive stage-wise orthogonal matching pursuit
This is the origin MATLAB implementation of SAStOMP in the following paper:
[A method for magnetotelluric data processing based on sparsity adaptive stage-wise orthogonal matching pursuit](https://doi.org/10.1016/j.jappgeo.2022.104577)

## function
```
Run deal_data.m to see example

deal_sp.m for data denoise

framing.m for data segmentation

Fuzzy_entropy_my.m for calculat fuzzy entropy

generate_dic1.m for dictionary generate

linear_ovladd.m for recovery

SAStOMP.m for SAStOMP sparse representation

spdiag.m for sparse diagonal metrices

normcols for dictionary normalization

stimulate_signal.mat is the simulated signals
```


## <span id="citelink">Citation</span>
If you find this repository useful in your research, please consider citing the following paper:

```
@inproceedings{SAStOMP-MT-2022,
    author    = {Jin Li and
               Shanshan Liu and
               Yiqun Peng and
               Jingtian Tang and
               Xian Zhang and
			   Yong Li},
	journal   = {Journal of Applied Geophysics},
	title     = {A method for magnetotelluric data processing based on sparsity adaptive stage-wise orthogonal matching pursuit},
    volume    = {198},
    year      = {2022},
}
```
## Contact
If you have any questions, feel free to contact Jin Li through Email (geologylj@163.com) or Github issues. Pull requests are highly welcomed!