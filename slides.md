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

# Obiettivi

<div class="mt-6 max-w-5xl mx-auto">
  <div class="text-center text-[26px] leading-tight font-semibold text-slate-800 max-w-4xl mx-auto">
    Sviluppare un sistema multimodale per il rilevamento non invasivo dello stress sociale in VR
  </div>

  <div class="objectives-timeline mt-10">
    <div class="objectives-line"></div>
    <div class="objectives-step objectives-step-top">
      <div class="objectives-card">Virtual Human<br>generativo</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-bottom">
      <div class="objectives-card">Pipeline<br>multimodale</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-top">
      <div class="objectives-card">LSTM-VAE</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-bottom">
      <div class="objectives-card">Validazione</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
  </div>
</div>

<style>
.objectives-timeline {
  position: relative;
  height: 300px;
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  column-gap: 0.75rem;
}

.objectives-line {
  position: absolute;
  left: 1.25rem;
  right: 1.25rem;
  top: 50%;
  transform: translateY(-50%);
  height: 4px;
  border-radius: 9999px;
  background: linear-gradient(90deg, #93c5fd, #3b82f6, #93c5fd);
}

.objectives-step {
  position: relative;
}

.objectives-dot {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 16px;
  height: 16px;
  border-radius: 9999px;
  background: #2563eb;
  box-shadow: 0 0 0 6px #eff6ff;
  z-index: 3;
}

.objectives-card {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  min-width: 170px;
  max-width: 190px;
  text-align: center;
  font-size: 0.95rem;
  line-height: 1.25rem;
  font-weight: 600;
  color: #1e3a8a;
  background: #ffffff;
  border: 1px solid #93c5fd;
  border-radius: 0.85rem;
  padding: 0.6rem 0.8rem;
  box-shadow: 0 8px 22px -16px rgba(30, 58, 138, 0.55);
  z-index: 2;
}

.objectives-connector {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  background: #60a5fa;
  z-index: 1;
}

.objectives-step-top .objectives-card {
  bottom: calc(50% + 48px);
}

.objectives-step-top .objectives-connector {
  bottom: calc(50% + 10px);
  height: 38px;
}

.objectives-step-bottom .objectives-card {
  top: calc(50% + 48px);
}

.objectives-step-bottom .objectives-connector {
  top: calc(50% + 10px);
  height: 38px;
}
</style>

---

# Hardware, Tool e Acquisizione

<br>

<div class="grid grid-cols-2 gap-4">
  <div v-click class="hw-grid-card border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="https://placehold.co/400x400?text=Unreal" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-20 bg-gray-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Unreal</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">MetaXR</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">MetaHuman</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/meta-quest-pro.jpg" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-20 bg-gray-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Meta Quest Pro</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">Face Tracking</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">Eye Tracking</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/empatica.png" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-16 bg-gray-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Empatica EmbracePlus</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">EDA</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">HRV</span>
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">ACC</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border border-gray-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="https://placehold.co/400x400?text=DANTE" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-16 bg-gray-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">DANTE</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border border-blue-400 text-blue-400 rounded-full px-3.25 py-1.5 text-center">Stress percepito</span>
      </div>
    </div>
  </div>
</div>

<style>
.hw-grid-card {
  transition: transform 550ms cubic-bezier(0.22, 1, 0.36, 1), opacity 550ms cubic-bezier(0.22, 1, 0.36, 1), filter 550ms cubic-bezier(0.22, 1, 0.36, 1);
  transform-origin: center center;
  will-change: transform, opacity, filter;
}

.hw-grid-card.slidev-vclick-hidden {
  opacity: 0;
  transform: translateY(50px) scale(0.97);
  filter: blur(4px);
}

</style>

---

# Il Virtual Human come Stressor

<br>

<div class="min-h-[430px] flex flex-col">
  <div class="grid grid-cols-4 gap-4">
    <div v-click class="vh-stressor-card border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:user-avatar class="text-4xl text-blue-500" />
      <div class="font-bold">Realismo visivo</div>
      <div class="text-sm">Interviewer fotorealistico con animazioni emotive</div>
    </div>
    <div v-click class="vh-stressor-card border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:chat class="text-4xl text-blue-500" />
      <div class="font-bold">Dialogo generativo</div>
      <div class="text-sm">Conversazione contestuale e non scriptata tramite LLM</div>
    </div>
    <div v-click class="vh-stressor-card border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:pedestrian class="text-4xl text-blue-500" />
      <div class="font-bold">Comunicazione non verbale</div>
      <div class="text-sm">Prossemica, espressioni e gestualità</div>
    </div>
    <div v-click class="vh-stressor-card border border-gray-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:warning-alt class="text-4xl text-blue-500" />
      <div class="font-bold">Tono valutativo</div>
      <div class="text-sm">Personalità coerente progettata per indurre stress sociale</div>
    </div>
  </div>

  <div class="flex-1 flex items-center justify-center">
    <img v-if="$clicks == 1" src="https://placehold.co/400x225?text=1" class="rounded shadow" width="300"/>
    <img v-if="$clicks == 2" src="https://placehold.co/400x225?text=2" class="rounded shadow" width="300"/>
    <img v-if="$clicks == 3" src="https://placehold.co/400x225?text=3" class="rounded shadow" width="300"/>
    <img v-if="$clicks == 4" src="https://placehold.co/400x225?text=4" class="rounded shadow" width="300"/>
  </div>
</div>

<style>
.vh-stressor-card {
  transition: transform 550ms cubic-bezier(0.22, 1, 0.36, 1), opacity 550ms cubic-bezier(0.22, 1, 0.36, 1), filter 550ms cubic-bezier(0.22, 1, 0.36, 1);
  will-change: transform, opacity, filter;
}

.vh-stressor-card.slidev-vclick-hidden {
  opacity: 0;
  transform: translateX(-40px);
  filter: blur(5px);
}
</style>

---

# Struttura della demo

<div class="w-full max-w-5xl mx-auto mt-15 relative">
  <div class="relative z-20">
    <div class="text-s font-bold tracking-widest text-blue-700 mb-10 text-center w-full uppercase opacity-50">
      Fase Sperimentale
    </div>
    <div v-click class="hidden"></div>
    <div v-click class="hidden"></div>
    <div class="flex items-start justify-between px-4 pb-4 gap-2">
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full bg-blue-600 ring-4 ring-blue-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Questionario<br>Demografico</div>
      </div>
      <div class="flex-1 h-0.75 bg-blue-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 border-blue-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full bg-blue-600 ring-4 ring-blue-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Selezione<br>Lavoro</div>
      </div>
      <div class="flex-1 h-0.75 bg-blue-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 border-blue-200 rotate-45"></div>
      </div>
      <div class="flex flex-col items-center w-32 relative text-center">
        <div :class="$clicks >= 1 ? 'w-10 h-10' : 'w-7 h-7'" class="rounded-full bg-blue-600 ring-4 ring-blue-100 shadow-lg z-30 transition-all duration-500" />
        <div :class="$clicks >= 1 ? 'font-bold text-blue-700' : ''" class="mt-2 text-xs leading-tight">Simulazione<br>Colloquio</div>
      </div>
      <div class="flex-1 h-0.75 bg-blue-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 border-blue-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full bg-blue-600 ring-4 ring-blue-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Annotazione<br>DANTE</div>
      </div>
      <div class="flex-1 h-0.75 bg-blue-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 border-blue-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full bg-blue-600 ring-4 ring-blue-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Questionario<br>Valutativo</div>
      </div>
    </div>
  </div>

  <div :class="$clicks >= 2 ? 'max-h-[280px] opacity-100 scale-y-100 mt-5 p-5 border-indigo-200 overflow-visible delay-75' : 'max-h-0 opacity-0 scale-y-0 mt-0 py-0 px-8 border-transparent pointer-events-none overflow-hidden delay-0'" class="relative bg-white rounded-xl border-2 shadow-xl mx-4 origin-top transition-all duration-750 ease-[cubic-bezier(0.22,1,0.36,1)]">
    <div class="absolute -top-3 left-1/2 -translate-x-1/2 w-5 h-5 bg-white border-t-2 border-l-2 border-indigo-200 rotate-45 z-20"></div>
    <div class="text-xs font-bold text-indigo-500 bg-indigo-50 px-2 py-0.5 rounded border border-indigo-100 uppercase tracking-tighter w-fit mx-auto mb-8">Struttura Colloquio</div>
    <div class="px-2">
      <div class="flex items-center justify-between gap-2">
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-purple-500" />
        </div>
        <div class="flex-1 h-0.5 bg-indigo-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 border-indigo-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-lightblue-500" />
        </div>
        <div class="flex-1 h-0.5 bg-indigo-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 border-indigo-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-green-500" />
        </div>
        <div class="flex-1 h-0.5 bg-indigo-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 border-indigo-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-orange-500" />
        </div>
        <div class="flex-1 h-0.5 bg-indigo-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 border-indigo-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-red-500" />
        </div>
      </div>
      <div class="mt-2 flex items-start justify-between gap-2">
        <div class="w-24 text-xs text-center font-semibold text-indigo-900 leading-tight">Baseline</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold text-indigo-900 leading-tight">Presentazione</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold text-indigo-900 leading-tight">Esperienze<br>Passate</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold text-indigo-900 leading-tight">Scenario<br>STAR</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold text-indigo-900 leading-tight">Feedback<br>Finale</div>
      </div>
    </div>
  </div>
  
  <div :class="$clicks >= 2 ? 'opacity-0 max-h-0 mt-0 mb-0 scale-90 pointer-events-none delay-0' : 'opacity-100 max-h-[180px] mt-8 mb-2 scale-100 delay-75'" class="flex items-center justify-between overflow-hidden transition-all duration-750 ease-[cubic-bezier(0.22,1,0.36,1)]">
    <img src="https://placehold.co/400x225?text=JobHub" class="rounded shadow" width="275"/>
    <img src="https://placehold.co/400x225?text=Colloquio" class="rounded shadow" width="275"/>
    <img src="https://placehold.co/400x225?text=DANTE" class="rounded shadow" width="275"/>
  </div>
</div>

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
