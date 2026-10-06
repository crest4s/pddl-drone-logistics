# pddl-drone-logistics

Emergency logistics with drones modelled in PDDL. Drones pick up boxes with supplies (food, medicine...) at a depot and deliver them to people at different locations. The domain is extended step by step and every version comes with a random problem generator and a benchmark of automated planners.

Lab project for the *Planificación Automática* (Automated Planning) course at the University of Alcalá (UAH), 2025–26 academic year.

## Parts

| Folder | Domain version | Planners benchmarked |
|--------|----------------|----------------------|
| `parte1/` | STRIPS + `:typing`. One drone with two arms (modelled as `arm` objects) that picks up, carries and delivers boxes. | pyperplan (BFS, IDS, A\*, GBFS with `hmax`, `hadd`, `hff`, `lmcut`...) and FF |
| `parte2-1/` | Arms are replaced by **carriers** (transporters) with a capacity counter (`num` objects n0–n4). | FF, pyperplan |
| `parte2-2/` | **Action costs** (`:action-costs`): every action increases `total-cost`, flights cost `fly-cost(from, to)`; the metric minimises total cost. | Fast Downward via planutils (`lama-first`, `seq-sat-fdss-2`, `seq-sat-fd-autotune-2` and optimal configurations) |
| `parte3/` | **Durative actions** (`:durative-actions`, `:fluents`): actions last 5 s and flights last `fly-cost`; several drones work concurrently. | LPG-td (speed and quality modes, 1–10 drones) |

Each part contains:

- `src/domain.pddl`, `src/problem1.pddl`, `src/problem2.pddl` — domain and two hand-written problems.
- `src/generate-problem.py` — random problem generator (`-d` drones, `-r` carriers, `-l` locations, `-p` people, `-c` boxes, `-g` goals). Problems are written to `src/generated/problem/`.
- `docs/` — modelling decisions, exercise guide, executive summary with the results, and full write-up (in Spanish).
- `scripts/` — experiment runners (`run_experiments.sh`, `analyze_results.py`, `generate_lpg_problems.py`, `run_lpg_experiments.py`).

Other folders:

- `results/` — raw benchmark results (CSV, `;`-separated) for each part.
- `graficas/` — figures generated with `graficas/generate_graphs.py` (FF scalability, algorithm and heuristic comparison, satisficing planners, LPG quality vs. speed).

## Requirements

- Python 3
- [pyperplan](https://github.com/aibasel/pyperplan) and [planutils](https://github.com/AI-Planning/planutils) (`pip install -r parte2-2/requirements.txt`)
- [FF](https://fai.cs.uni-saarland.de/hoffmann/ff.html) and LPG-td (can be installed with planutils)
- `matplotlib` and `numpy` to regenerate the figures

## Usage

```bash
cd parte1/src

# Generate a problem: 1 drone, 0 carriers, 5 locations, 5 people, 5 boxes, 5 goals
python3 generate-problem.py -d 1 -r 0 -l 5 -p 5 -c 5 -g 5

# Solve it
pyperplan -s gbfs -H hff domain.pddl generated/problem/<problem>.pddl
ff -o domain.pddl -f generated/problem/<problem>.pddl
```

The exact commands used in every experiment are listed in the `docs/GUIA_EJERCICIO_*.md` files of each part and in `comandos.txt`. `parte1/README.md` has a detailed walkthrough of the first part (in Spanish).

## Authors

- Adrián Morales Rodríguez ([@crest4s](https://github.com/crest4s))
- [@aliciasiguenza](https://github.com/aliciasiguenza)
- [@avuren13](https://github.com/avuren13)
