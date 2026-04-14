---
theme: seriph
highlighter: shiki
lineNumbers: false
fonts:
  sans: 'Inter'
  mono: 'Fira Code'
title: 'ALESSIA'
---

# ALESSIA
## Affective Latent Evaluation of Social Stress in Interview Agents

<br>

**Christian Pozzoli**

Relatore: Prof. Laura Anna Ripamonti · Correlatore: Dott. Susanna Brambilla

Università degli Studi di Milano — Laurea Magistrale in Informatica — A.A. 2024–2025

---
layout: center
---

# Il Problema

<br>

> Le interfacce tradizionali **ignorano lo stato interno** dell'utente.
> Il **colloquio di lavoro** è un potente stressor sociale, riproducibile e controllabile.

<br>

```mermaid
flowchart LR
  A[👤 Utente in VR] --> B[😰 Stress sociale]
  B --> C[📡 Segnali comportamentali\n& fisiologici]
  C --> D[🤖 Modello AI]
  D --> E[📊 Stress Score]
```

---
layout: center
---

# Research Questions

<br>

| # | Domanda |
|---|---|
| RQ1 | Face/eye tracking VR → classificazione stress? |
| RQ2 | Errore LSTM-VAE → metrica di deviazione dal baseline? |
| RQ3 | Stress psicologico vs. fisiologico: quale correla di più? |
| RQ4 | Face tracking vs. gaze tracking: contributo relativo? |
| RQ5 | Il modello può essere un *early indicator* dello stress? |

---
layout: two-cols
---

# Il Sistema

::left::

```mermaid
flowchart TD
  A[🥽 Meta Quest Pro\nFace & Gaze tracking] --> D
  B[⌚ EmbracePlus\nEDA & HRV] --> D
  C[🖥️ DANTE\nAnnotazioni psicologiche] --> D
  D[Pipeline multimodale] --> E[LSTM-VAE]
  E --> F[📈 Stress Score continuo]
```

::right::

<br><br>

- **Ambiente VR** in Unreal Engine 5
- **MetaHuman** interviewer fotorealistico
- **LLM** per dialogo generativo
- **31 partecipanti**

---
layout: center
---

# L'Ambiente Virtuale

<br>

```mermaid
flowchart LR
  subgraph UE5 [Unreal Engine 5]
    A[MetaHuman\nInterviewer] -->|LLM| B[Dialogo generativo\n& personalità]
    B --> C[Comunicazione\nnon verbale]
  end
  subgraph Fasi
    D[🤝 Accoglienza] --> E[💼 Intervista] --> F[👋 Congedo]
  end
  UE5 --> Fasi
```

<br>

> Lo scenario concentra i tre ingredienti chiave dello stress valutativo:
> **scrutinio pubblico · pressione da performance · asimmetria gerarchica**

---
layout: center
---

# Il Modello: LSTM-VAE

<br>

```mermaid
flowchart LR
  subgraph Training [🎓 Training — solo baseline]
    A[Sequenza\nbaseline] --> B[Encoder\nLSTM]
    B --> C((z))
    C --> D[Decoder\nLSTM]
    D --> E[Ricostruzione]
  end
  subgraph Inference [🔍 Inference — colloquio]
    F[Sequenza\ncolloquio] --> G[Encoder\nLSTM]
    G --> H((z'))
    H --> I[Decoder\nLSTM]
    I --> J[Errore di\nricostruzione]
    J --> K[📊 Stress Score]
  end
```

---

# Risultati

<br>

| Modalità | ROC-AUC | Note |
|---|---|---|
| **Face tracking** | **0.76** | Segnale più stabile e discriminativo |
| Gaze tracking | < Face | Rumore da movimenti spontanei |
| Fusione face + gaze | ↓ vs solo face | Gaze "inquina" il segnale facciale |
| Multi-subject | ~chance | Personalizzazione essenziale |

<br>

<v-click>

> 🔑 La dimensione **psicologica** (DANTE) correla più della fisiologica con lo spazio latente.

</v-click>

---
layout: two-cols
---

# Analisi Temporale

::left::

```mermaid
sequenceDiagram
  participant V as 🤖 VAE (comportamento)
  participant E as 📡 EDA (fisiologia)
  Note over V: Anomalia rilevata
  V-->>E: ~ +1.5 / +2 sec
  Note over E: Risposta elettrodermica
```

::right::

<br><br>

- Il modello **precede** la risposta EDA di **1.5–2 s**
- Agisce come **early warning** prima della manifestazione autonomica
- Correlazione con HRV più diffusa: riflette stato tonico, non picchi discreti

---
layout: center
---

# Gaze: due profili emergenti

<br>

```mermaid
flowchart LR
  A[👁️ Comportamento\ndi gaze sotto stress] --> B["🔍 Scanner\nesplorazione visiva\nampia e dinamica"]
  A --> C["👀 Watcher\nfissazione prolungata\nsull'interlocutore"]
```

<br>

> Il gaze è **soggetto-dipendente**: non generalizza tra individui,
> conferma la necessità di modelli personalizzati.

---
layout: center
---

# Conclusioni

<br>

```mermaid
flowchart LR
  A[🥽 Telemetria VR\ncommodity] --> B[ALESSIA\nLSTM-VAE]
  B --> C[📊 Stress sociale\nrilevato in tempo reale]
  C --> D[🔁 Sistemi VR\nclosed-loop]
```

<br>

<v-clicks>

- ✅ Stress sociale rilevabile **non invasivamente** da headset VR
- ✅ **Personalizzazione** fondamentale: lo stress è soggetto-dipendente
- ✅ Il modello è un **early indicator**: anticipa la fisiologia di ~2 s
- 🔭 Prossimo passo: adattamento in tempo reale del Virtual Human

</v-clicks>

---
layout: center
---

# Grazie

<br><br>

**Christian Pozzoli**

`christian.pozzoli@studenti.unimi.it`

<br>

Università degli Studi di Milano
Laurea Magistrale in Informatica — A.A. 2024–2025
