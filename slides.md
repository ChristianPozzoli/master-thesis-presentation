---
theme: seriph
background: https://source.unsplash.com/featured/?technology,virtual-reality
class: text-center text-blue-800
highlighter: shiki
colorSchema: light
lineNumbers: false
info: |
  ## ALESSIA Presentation
  Tesi di Laurea di Christian Pozzoli
drawings:
  persist: false
transition: slide-left
title: ALESSIA - Affective Latent Evaluation of Social Stress
---

# ALESSIA
### Affective Latent Evaluation of Social Stress in Interview Agents

**Candidato:** Christian Pozzoli  
**Relatore:** Prof. Laura Anna Ripamonti  
**Correlatore:** Dott. Susanna Brambilla  

Anno Accademico 2024-2025

---
layout: two-cols
---

# Il Contesto

<br>

- Interfacce tradizionali: utente come **dispositivo stateless**
- **VR**: interazioni immersive con stimoli sociali controllati
- **Virtual Human**: da NPC scriptati a agenti generativi fotorealistici

<br>

- Nuovi scenari: training sociale, public speaking training, terapia di esposizione, colloqui simulati

::right::

<div class="flex flex-col items-center gap-5">
	<img src="https://placehold.co/400x225?text=Doubt LA Noire" class="rounded shadow" width="250"/>
	<img src="https://placehold.co/400x225?text=Interazione VR" class="rounded shadow" width="250"/>
	<img src="https://placehold.co/400x225?text=NVIDIA ACE" class="rounded shadow" width="250"/>
</div>

---
layout: two-cols
---

# Obiettivi

<br>

**Sviluppare** un sistema multimodale per il rilevamento non invasivo dello stress sociale in VR.

- Ambiente VR immersivo con un **Virtual Human generativo** come stressor sociale
- Pipeline di acquisizione **multimodale**: face tracking e gaze tracking
- Modello **LSTM-VAE** per la stima continua dello stress tramite deviazione dal baseline
- Validazione tramite segnali fisiologici (**EDA, HRV**) e annotazioni psicologiche (**DANTE**)

---
layout: center
---

# Hardware e Acquisizione

<br>

<div class="flex flex-col gap-4">
  <div v-click class="border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/meta-quest-pro.jpg" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-20 bg-gray-300 shrink-0" />
    <div>
      <div class="font-bold text-lg mb-2">Meta Quest Pro</div>
      <div class="flex gap-4 text-sm">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3 py-1">Face Tracking</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3 py-1">Eye Tracking</span>
      </div>
    </div>
  </div>
  <div v-click class="border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/empatica.png" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-16 bg-gray-300 shrink-0" />
    <div>
      <div class="font-bold text-lg mb-2">Empatica EmbracePlus</div>
      <div class="flex gap-4 text-sm">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3 py-1">EDA</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3 py-1">HRV</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3 py-1">BVP</span>
      </div>
    </div>
  </div>
</div>

---
layout: center
---

# Il Virtual Human come Stressor

<br>

<div class="grid grid-cols-4 gap-4">
  <div v-click class="border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
    <carbon:user-avatar class="text-3xl text-blue-500" />
    <div class="font-bold">Realismo visivo</div>
    <div class="text-sm">Interviewer fotorealistico con lip sync e animazioni emotive</div>
  </div>
  <div v-click class="border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
    <carbon:chat class="text-3xl text-blue-500" />
    <div class="font-bold">Dialogo generativo</div>
    <div class="text-sm">Conversazione contestuale e non scriptata tramite LLM</div>
  </div>
  <div v-click class="border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
    <carbon:pedestrian class="text-3xl text-blue-500" />
    <div class="font-bold">Comunicazione non verbale</div>
    <div class="text-sm">Prossemica, micro-espressioni e gestualità calibrate</div>
  </div>
  <div v-click class="border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
    <carbon:warning-alt class="text-3xl text-blue-500" />
    <div class="font-bold">Tono valutativo</div>
    <div class="text-sm">Personalità coerente progettata per indurre stress sociale</div>
  </div>
</div>

---

# Struttura del Colloquio

**Fasi dell'Esperimento (10-15 minuti)**

1. **Presentazione**: Accoglienza e calibrazione iniziale.
2. **Esperienze Passate**: Domande biografiche a basso carico cognitivo.
3. **Scenario STAR**: Metodo strutturato (Situation, Task, Action, Result) per indurre carico cognitivo e stress prestazionale.
4. **Feedback Finale**: Chiusura dell'interazione e debriefing.

---
layout: center
---

# Architettura del Modello

<br>

```mermaid
flowchart LR
  A[Input\nsequenza] --> B[Encoder\nLSTM]
  B --> C1[μ]
  B --> C2[σ]
  C1 & C2 --> D((z))
  D --> E[Decoder\nLSTM]
  E --> F[Ricostruzione\nsequenza]
  F --> G[Errore di\nricostruzione]
  G --> H[Stress\nScore]
```

<br>

> Il modello è addestrato **solo sul baseline**. Durante il colloquio, un alto errore di ricostruzione segnala una deviazione dallo stato di riposo.

---

# Risultati: Face vs Gaze

**Analisi delle Modalità**

- **Face Tracking**: Si è dimostrato l'indicatore più **robusto e coerente**. Le micro-espressioni catturate dal visore sono correlate direttamente all'insorgenza dello stress.
- **Gaze Tracking**: Risultato meno affidabile come predittore unico, influenzato fortemente dal compito visivo (guardare l'intervistatore) più che dallo stato emotivo latente.
- **Performance**: Il modello basato sul volto ha raggiunto un **ROC-AUC di 0.7614**.

---

# Personalizzazione del Modello

<br>

- La risposta allo stress varia **drasticamente tra individui**: un modello generalista non è sufficiente
- **Single-subject** >> **leave-one-subject-out**: la personalizzazione è essenziale
- Esplorate due architetture encoder:
  - **Single-encoder**: tutte le feature in un unico spazio latente
  - **Multi-encoder**: encoder separati per modalità (face, gaze), fusione tardiva
- La fusione face + gaze **degrada le performance**: il gaze introduce rumore che "inquina" il segnale facciale

---

# Dinamiche Temporali

**Il "Lead Comportamentale"**

- **Anticipazione**: Il modello rileva anomalie facciali e oculari **1.5 - 2 secondi prima** della risposta fisiologica.
- **Validazione**: L'errore di ricostruzione precede i picchi di EDA (sudorazione).
- **Implicazione**: La biometria "esterna" (volto) è un segnale di allerta precoce rispetto alla risposta del sistema nervoso autonomo.

---

# Conclusioni e Lavori Futuri

**Sintesi dei Risultati**
- Lo stress in VR è una dimensione altamente soggettiva.
- Identificazione di profili utente: **"Scanners"** (iper-focalizzati) vs **"Watchers"** (evitanti).

**Evoluzioni Future**
- Analisi dei **micro-tremori** dei controller per aggiungere una dimensione motoria.
- Affinamento della personalità dell'agente tramite feedback neurale in tempo reale.

---
layout: center
class: text-center
---

# Grazie per l'attenzione

**Christian Pozzoli** christian.pozzoli@studenti.unimi.it
