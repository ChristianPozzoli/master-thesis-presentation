---
theme: seriph
background: https://source.unsplash.com/featured/?technology,virtual-reality
class: text-center c-text-primary-900
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

<style>
@import "./style.css";
</style>

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
  <div class="text-center text-[26px] leading-tight font-semibold c-text-primary-900 max-w-4xl mx-auto">
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
  background: linear-gradient(90deg, var(--c-primary-300), var(--c-primary-500), var(--c-primary-300));
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
  background: var(--c-primary-600);
  box-shadow: 0 0 0 6px var(--c-primary-50);
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
  color: var(--c-primary-900);
  background: var(--c-white);
  border: 1px solid var(--c-primary-300);
  border-radius: 0.85rem;
  padding: 0.6rem 0.8rem;
  box-shadow: 0 8px 22px -16px rgba(var(--c-shadow-primary-rgb), 0.55);
  z-index: 2;
}

.objectives-connector {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  background: var(--c-primary-400);
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
  <div v-click class="hw-grid-card border c-border-neutral-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="https://placehold.co/400x400?text=Unreal" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-20 c-bg-neutral-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Unreal</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">MetaXR</span>
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">MetaHuman</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-neutral-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/meta-quest-pro.jpg" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-20 c-bg-neutral-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Meta Quest Pro</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">Face Tracking</span>
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">Eye Tracking</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-neutral-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/empatica.png" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-16 c-bg-neutral-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Empatica EmbracePlus</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">EDA</span>
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">HRV</span>
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">ACC</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-neutral-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="https://placehold.co/400x400?text=DANTE" width="150" class="rounded-lg shrink-0" />
    <div class="w-px h-16 c-bg-neutral-300 shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">DANTE</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="border c-border-primary-400 c-text-primary-400 rounded-full px-3.25 py-1.5 text-center">Stress percepito</span>
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
    <div v-click class="vh-stressor-card border c-border-neutral-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:user-avatar class="text-4xl c-text-primary-500" />
      <div class="font-bold">Realismo visivo</div>
      <div class="text-sm">Interviewer fotorealistico con animazioni emotive</div>
    </div>
    <div v-click class="vh-stressor-card border c-border-neutral-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:chat class="text-4xl c-text-primary-500" />
      <div class="font-bold">Dialogo generativo</div>
      <div class="text-sm">Conversazione contestuale e non scriptata tramite LLM</div>
    </div>
    <div v-click class="vh-stressor-card border c-border-neutral-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:pedestrian class="text-4xl c-text-primary-500" />
      <div class="font-bold">Comunicazione non verbale</div>
      <div class="text-sm">Prossemica, espressioni e gestualità</div>
    </div>
    <div v-click class="vh-stressor-card border c-border-neutral-300 rounded-xl p-4 flex flex-col items-center gap-2 text-center">
      <carbon:warning-alt class="text-4xl c-text-primary-500" />
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
    <div class="text-s font-bold tracking-widest c-text-primary-700 mb-10 text-center w-full uppercase opacity-50">
      Fase Sperimentale
    </div>
    <div v-click class="hidden"></div>
    <div v-click class="hidden"></div>
    <div class="flex items-start justify-between px-4 pb-4 gap-2">
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full c-bg-primary-600 ring-4 c-ring-primary-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Questionario<br>Demografico</div>
      </div>
      <div class="flex-1 h-0.75 c-bg-primary-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 c-border-primary-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full c-bg-primary-600 ring-4 c-ring-primary-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Selezione<br>Lavoro</div>
      </div>
      <div class="flex-1 h-0.75 c-bg-primary-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 c-border-primary-200 rotate-45"></div>
      </div>
      <div class="flex flex-col items-center w-32 relative text-center">
        <div :class="$clicks >= 1 ? 'w-10 h-10' : 'w-7 h-7'" class="rounded-full c-bg-primary-600 ring-4 c-ring-primary-100 shadow-lg z-30 transition-all duration-500" />
        <div :class="$clicks >= 1 ? 'font-bold c-text-primary-700' : ''" class="mt-2 text-xs leading-tight">Simulazione<br>Colloquio</div>
      </div>
      <div class="flex-1 h-0.75 c-bg-primary-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 c-border-primary-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full c-bg-primary-600 ring-4 c-ring-primary-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Annotazione<br>DANTE</div>
      </div>
      <div class="flex-1 h-0.75 c-bg-primary-200 relative mx-1 self-center">
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-3 h-3 border-t-3 border-r-3 c-border-primary-200 rotate-45"></div>
      </div>
      <div :class="$clicks >= 1 ? 'opacity-75' : 'opacity-100'" class="flex flex-col items-center w-32 text-center transition-opacity duration-500">
        <div class="w-7 h-7 rounded-full c-bg-primary-600 ring-4 c-ring-primary-50" />
        <div class="mt-2 text-[10px] font-medium leading-tight">Questionario<br>Valutativo</div>
      </div>
    </div>
  </div>

  <div :class="$clicks >= 2 ? 'max-h-[280px] opacity-100 scale-y-100 mt-5 p-5 c-border-primary-200 overflow-visible delay-75' : 'max-h-0 opacity-0 scale-y-0 mt-0 py-0 px-8 border-transparent pointer-events-none overflow-hidden delay-0'" class="relative bg-white rounded-xl border-2 shadow-xl mx-4 origin-top transition-all duration-750 ease-[cubic-bezier(0.22,1,0.36,1)]">
    <div class="absolute -top-3 left-1/2 -translate-x-1/2 w-5 h-5 bg-white border-t-2 border-l-2 c-border-primary-200 rotate-45 z-20"></div>
    <div class="text-xs font-bold c-text-primary-700 c-bg-primary-50 px-2 py-0.5 rounded border c-border-primary-100 uppercase tracking-tighter w-fit mx-auto mb-8">Struttura Colloquio</div>
    <div class="px-2">
      <div class="flex items-center justify-between gap-2">
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-purple-500" />
        </div>
        <div class="flex-1 h-0.5 c-bg-primary-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 c-border-primary-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-lightblue-500" />
        </div>
        <div class="flex-1 h-0.5 c-bg-primary-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 c-border-primary-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-green-500" />
        </div>
        <div class="flex-1 h-0.5 c-bg-primary-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 c-border-primary-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-orange-500" />
        </div>
        <div class="flex-1 h-0.5 c-bg-primary-200 relative mx-1 self-center">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-2 h-2 border-t-2 border-r-2 c-border-primary-200 rotate-45"></div>
        </div>
        <div class="w-24 flex justify-center z-10">
          <div class="w-10 h-5 rounded-full bg-red-500" />
        </div>
      </div>
      <div class="mt-2 flex items-start justify-between gap-2">
        <div class="w-24 text-xs text-center font-semibold c-text-primary-900 leading-tight">Baseline</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold c-text-primary-900 leading-tight">Presentazione</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold c-text-primary-900 leading-tight">Esperienze<br>Passate</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold c-text-primary-900 leading-tight">Scenario<br>STAR</div>
        <div class="flex-1"></div>
        <div class="w-24 text-xs text-center font-semibold c-text-primary-900 leading-tight">Feedback<br>Finale</div>
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
    %% Definizione degli stili
    classDef input fill:#f1f5f9,stroke:#64748b,stroke-width:2px,color:#1e293b
    classDef model fill:#dbeafe,stroke:#3b82f6,stroke-width:2px,color:#1e40af,font-weight:bold
    classDef latent fill:#fef3c7,stroke:#d97706,stroke-width:2px,color:#92400e
    classDef output fill:#dcfce7,stroke:#16a34a,stroke-width:2px,color:#166534

    subgraph "Preprocessing"
        A(Input<br>Sequenza)
    end

    subgraph "VAE Architecture"
        direction LR
        A --> B(Encoder<br>LSTM)
        
        %% Uso <br> per pareggiare l'altezza dei box gialli rispetto ai blu
        B --> C1(fa:fa-arrow-right &mu; <br> )
        B --> C2(fa:fa-arrow-right &sigma; <br> )
        
        C1 & C2 -.-> D((z))
        D --> E(Decoder<br>LSTM)
    end

    subgraph "Analysis"
        E --> F(Ricostruzione<br>Sequenza)
        F --> G{Errore di<br>Ricostruzione}
        G --> H([STRESS SCORE])
    end

    %% Assegnazione delle classi
    class A input
    class B,E model
    class C1,C2,D latent
    class F,G,H output

    %% Link styling
    linkStyle default stroke:#94a3b8,stroke-width:2px,fill:none
```

<br>

> Il modello è addestrato **solo sul baseline**. Durante il colloquio, un alto errore di ricostruzione segnala una deviazione dallo stato di riposo.

<br>
<br>

<img src="./images/stress_plot_subject_eye_tracking.png" class="rounded shadow"/>

---

# Risultati: Face vs Gaze

**Analisi delle Modalità**

- **Face Tracking**: Si è dimostrato l'indicatore più **robusto e coerente**. Le micro-espressioni catturate dal visore sono correlate direttamente all'insorgenza dello stress.
- **Gaze Tracking**: Risultato meno affidabile come predittore unico, influenzato fortemente dal compito visivo (guardare l'intervistatore) più che dallo stato emotivo latente.
- **Performance**: Il modello basato sul volto ha raggiunto un **ROC-AUC di 0.7614**.

---
layout: two-cols
style: 'grid-template-columns: 1fr 2fr;'
---

# Personalizzazione Modello

<br>

<div v-click class="hidden"></div>
<div v-click class="hidden"></div>

<div class="mt-6 flex flex-col gap-6 justify-center items-start text-center">
  <div class="ps-option" :class="$clicks === 0 ? 'ps-option-active' : 'ps-option-idle'">
    <span class="ps-rail" :class="$clicks === 0 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
    <span class="ps-label min-w-35">Single-Subject<br>vs<br>Leave One Out</span>
  </div>
  <div class="ps-option" :class="$clicks === 1 ? 'ps-option-active' : 'ps-option-idle'">
    <span class="ps-rail" :class="$clicks === 1 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
    <span class="ps-label min-w-35">Single-encoder<br>vs<br>Multi-encoder</span>
  </div>
  <div class="ps-option" :class="$clicks >= 2 ? 'ps-option-active' : 'ps-option-idle'">
    <span class="ps-rail" :class="$clicks >= 2 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
    <span class="ps-label min-w-35">Rumore Gaze</span>
  </div>
</div>

::right::

<div class="relative h-[430px] w-full max-w-4xl mx-auto mt-15">

  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 0 ? 'ps-panel-active' : 'ps-panel-inactive'">
    <div class="flex justify-center gap-6 mb-4">
      <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-500 rounded"></div><span class="text-xs">Gaze (Single)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-400 rounded"></div><span class="text-xs">Gaze (LOO)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-700 rounded"></div><span class="text-xs">Face (Single)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-400 rounded"></div><span class="text-xs">Face (LOO)</span></div>
    </div>
    <div class="relative h-90 border-b c-border-neutral-400 flex items-end justify-between px-4 pb-0">
      <div class="flex flex-col items-center flex-1">
        <div class="flex items-end gap-1 h-100 w-full justify-center">
          <div class="ps-bar w-3 c-bg-primary-500 rounded-t" style="transition-delay: 40ms" :style="{ height: $clicks === 0 ? '72.7%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 110ms" :style="{ height: $clicks === 0 ? '70.0%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-700 rounded-t" style="transition-delay: 180ms" :style="{ height: $clicks === 0 ? '77.8%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 250ms" :style="{ height: $clicks === 0 ? '76.2%' : '0%' }"></div>
        </div>
        <span class="text-[10px] font-bold mt-2 uppercase">AP</span>
      </div>
      <div class="flex flex-col items-center flex-1">
        <div class="flex items-end gap-1 h-100 w-full justify-center">
          <div class="ps-bar w-3 c-bg-primary-500 rounded-t" style="transition-delay: 90ms" :style="{ height: $clicks === 0 ? '63.0%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 160ms" :style="{ height: $clicks === 0 ? '60.7%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-700 rounded-t" style="transition-delay: 230ms" :style="{ height: $clicks === 0 ? '71.4%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 300ms" :style="{ height: $clicks === 0 ? '69.3%' : '0%' }"></div>
        </div>
        <span class="text-[10px] font-bold mt-2 uppercase">F1</span>
      </div>
      <div class="flex flex-col items-center flex-1">
        <div class="flex items-end gap-1 h-100 w-full justify-center">
          <div class="ps-bar w-3 c-bg-primary-500 rounded-t" style="transition-delay: 140ms" :style="{ height: $clicks === 0 ? '62.3%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 210ms" :style="{ height: $clicks === 0 ? '60.3%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-700 rounded-t" style="transition-delay: 280ms" :style="{ height: $clicks === 0 ? '76.1%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 350ms" :style="{ height: $clicks === 0 ? '73.0%' : '0%' }"></div>
        </div>
        <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC<br>exp</span>
      </div>
      <div class="flex flex-col items-center flex-1">
        <div class="flex items-end gap-1 h-100 w-full justify-center">
          <div class="ps-bar w-3 c-bg-primary-500 rounded-t" style="transition-delay: 190ms" :style="{ height: $clicks === 0 ? '54.2%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 260ms" :style="{ height: $clicks === 0 ? '52.6%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-700 rounded-t" style="transition-delay: 330ms" :style="{ height: $clicks === 0 ? '67.8%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 400ms" :style="{ height: $clicks === 0 ? '65.0%' : '0%' }"></div>
        </div>
        <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC<br>dante</span>
      </div>
      <div class="flex flex-col items-center flex-1">
        <div class="flex items-end gap-1 h-100 w-full justify-center">
          <div class="ps-bar w-3 c-bg-primary-500 rounded-t" style="transition-delay: 240ms" :style="{ height: $clicks === 0 ? '51.1%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 310ms" :style="{ height: $clicks === 0 ? '51.7%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-700 rounded-t" style="transition-delay: 380ms" :style="{ height: $clicks === 0 ? '60.7%' : '0%' }"></div>
          <div class="ps-bar w-3 c-bg-primary-400 rounded-t" style="transition-delay: 450ms" :style="{ height: $clicks === 0 ? '60.5%' : '0%' }"></div>
        </div>
        <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC BIN<br>dante</span>
      </div>
    </div>
    <p class="text-[10px] c-text-neutral-400 italic text-center">
      Confronto tra Single e Leave-One-Out (LOO) per Gaze e Face.
    </p>
  </div>

  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 1 ? 'ps-panel-active' : 'ps-panel-inactive'">
      <div class="flex justify-center gap-6 mb-4">
        <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-500 rounded"></div><span class="text-xs">Gaze (Single-Enc)</span></div>
        <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-primary-600 rounded"></div><span class="text-xs">Face (Single-Enc)</span></div>
        <div class="flex items-center gap-2"><div class="w-3 h-3 c-bg-phase-3 rounded"></div><span class="text-xs">Gaze+Face (Multi-Enc)</span></div>
      </div>
      <div class="relative h-90 border-b c-border-neutral-400 flex items-end justify-between px-4 pb-0">
        <div class="flex flex-col items-center flex-1">
          <div class="flex items-end gap-1.5 h-100 w-full justify-center">
            <div class="ps-bar w-4 c-bg-primary-500 rounded-t" style="transition-delay: 40ms" :style="{ height: $clicks === 1 ? '68.4%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-primary-600 rounded-t" style="transition-delay: 120ms" :style="{ height: $clicks === 1 ? '77.8%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-phase-3 rounded-t" style="transition-delay: 200ms" :style="{ height: $clicks === 1 ? '77.1%' : '0%' }"></div>
          </div>
          <span class="text-[10px] font-bold mt-2 uppercase">AP</span>
        </div>
        <div class="flex flex-col items-center flex-1">
          <div class="flex items-end gap-1.5 h-100 w-full justify-center">
            <div class="ps-bar w-4 c-bg-primary-500 rounded-t" style="transition-delay: 100ms" :style="{ height: $clicks === 1 ? '59.7%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-primary-600 rounded-t" style="transition-delay: 180ms" :style="{ height: $clicks === 1 ? '71.4%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-phase-3 rounded-t" style="transition-delay: 260ms" :style="{ height: $clicks === 1 ? '68.5%' : '0%' }"></div>
          </div>
          <span class="text-[10px] font-bold mt-2 uppercase">F1</span>
        </div>
        <div class="flex flex-col items-center flex-1">
          <div class="flex items-end gap-1.5 h-100 w-full justify-center">
            <div class="ps-bar w-4 c-bg-primary-500 rounded-t" style="transition-delay: 160ms" :style="{ height: $clicks === 1 ? '62.2%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-primary-600 rounded-t" style="transition-delay: 240ms" :style="{ height: $clicks === 1 ? '76.4%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-phase-3 rounded-t" style="transition-delay: 320ms" :style="{ height: $clicks === 1 ? '69.4%' : '0%' }"></div>
          </div>
          <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC<br>exp</span>
        </div>
        <div class="flex flex-col items-center flex-1">
          <div class="flex items-end gap-1.5 h-100 w-full justify-center">
            <div class="ps-bar w-4 c-bg-primary-500 rounded-t" style="transition-delay: 220ms" :style="{ height: $clicks === 1 ? '55.4%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-primary-600 rounded-t" style="transition-delay: 300ms" :style="{ height: $clicks === 1 ? '69.9%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-phase-3 rounded-t" style="transition-delay: 380ms" :style="{ height: $clicks === 1 ? '58.1%' : '0%' }"></div>
          </div>
          <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC<br>dante</span>
        </div>
        <div class="flex flex-col items-center flex-1">
          <div class="flex items-end gap-1.5 h-100 w-full justify-center">
            <div class="ps-bar w-4 c-bg-primary-500 rounded-t" style="transition-delay: 280ms" :style="{ height: $clicks === 1 ? '50.7%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-primary-600 rounded-t" style="transition-delay: 360ms" :style="{ height: $clicks === 1 ? '62.6%' : '0%' }"></div>
            <div class="ps-bar w-4 c-bg-phase-3 rounded-t" style="transition-delay: 440ms" :style="{ height: $clicks === 1 ? '52.7%' : '0%' }"></div>
          </div>
          <span class="text-[10px] font-bold mt-2 uppercase leading-none text-center">AUC BIN<br>dante</span>
        </div>
      </div>
      <p class="text-[10px] c-text-neutral-400 mt-4 italic text-center">
        Confronto tra varianti Unimodali e architettura Multimodale (Late-Fusion).
      </p>
    </div>

  <div class="absolute inset-0 flex flex-col transform-gpu transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] justify-center w-full items-center" :class="$clicks >= 2 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-50 z-0 pointer-events-none'">
    <img src="https://placehold.co/400x225?text=Grafico Gaze" class="rounded shadow" width="600"/>
  </div>
</div>

<style>
.ps-option {
  position: relative;
  display: inline-flex;
  align-items: center;
  gap: 0.65rem;
  border-radius: 0.8rem;
  border: 1px solid var(--c-neutral-300);
  width: fit-content;
  max-width: 20rem;
  padding: 0.45rem 0.62rem 0.45rem 0.42rem;
  transition: transform 480ms cubic-bezier(0.22, 1, 0.36, 1), border-color 480ms cubic-bezier(0.22, 1, 0.36, 1), box-shadow 480ms cubic-bezier(0.22, 1, 0.36, 1), background-color 480ms cubic-bezier(0.22, 1, 0.36, 1), color 480ms cubic-bezier(0.22, 1, 0.36, 1);
}

.ps-option-idle {
  color: var(--c-neutral-700);
  background: rgba(var(--c-neutral-bg-soft-rgb), 0.7);
}

.ps-option-active {
  color: var(--c-primary-700);
  border-color: var(--c-primary-300);
  background: linear-gradient(90deg, rgba(var(--c-primary-100-rgb), 0.95), rgba(var(--c-primary-50-rgb), 0.7));
  box-shadow: 0 12px 24px -18px rgba(var(--c-shadow-accent-rgb), 0.85);
  transform: translateX(4px) scale(1.1);
}

.ps-rail {
  width: 4px;
  height: 2.2rem;
  border-radius: 999px;
  transition: transform 420ms cubic-bezier(0.22, 1, 0.36, 1), opacity 420ms cubic-bezier(0.22, 1, 0.36, 1), background-color 420ms cubic-bezier(0.22, 1, 0.36, 1);
}

.ps-rail-idle {
  opacity: 0.15;
  background: var(--c-neutral-400);
  transform: scaleY(0.5);
}

.ps-rail-active {
  opacity: 1;
  background: var(--c-primary-600);
  transform: scaleY(1);
}

.ps-arrow {
  width: 1rem;
  font-weight: 800;
  transition: transform 420ms cubic-bezier(0.22, 1, 0.36, 1), opacity 420ms cubic-bezier(0.22, 1, 0.36, 1), color 420ms cubic-bezier(0.22, 1, 0.36, 1);
}

.ps-arrow-idle {
  opacity: 0.18;
  color: var(--c-neutral-400);
  transform: translateX(-3px);
}

.ps-arrow-active {
  opacity: 1;
  color: var(--c-primary-700);
  transform: translateX(0);
}

.ps-label {
  text-align: center;
  line-height: 1.14;
  font-size: 0.98rem;
  font-weight: 600;
}

.ps-panel {
  transition: opacity 760ms cubic-bezier(0.22, 1, 0.36, 1), transform 760ms cubic-bezier(0.22, 1, 0.36, 1);
  will-change: opacity, transform;
}

.ps-panel-active {
  opacity: 1;
  transform: translateX(0) scale(1);
  z-index: 20;
}

.ps-panel-inactive {
  opacity: 0;
  transform: translateX(10px) scale(0.992);
  z-index: 0;
  pointer-events: none;
}

.ps-bar {
  transition-property: height, opacity, filter;
  transition-duration: 940ms;
  transition-timing-function: cubic-bezier(0.22, 1, 0.36, 1);
  will-change: height;
}
</style>

---

# Dinamiche Temporali

**Il "Lead Comportamentale"**

- **Anticipazione**: Il modello rileva anomalie facciali e oculari **1.5 - 2 secondi prima** della risposta fisiologica.
- **Validazione**: L'errore di ricostruzione precede i picchi di EDA (sudorazione).
- **Implicazione**: La biometria "esterna" (volto) è un segnale di allerta precoce rispetto alla risposta del sistema nervoso autonomo.

---
layout: two-cols
---

# Conclusioni

<br>

- Lo stress sociale in VR è rilevabile in modo non invasivo da telemetria commodity
- Il face tracking è il segnale più discriminativo
- La dimensione psicologica correla più di quella fisiologica
- Lo stress è un fenomeno soggetto-dipendente

::right::

<div class="h-full flex items-center justify-center">
  <div class="future-orbit">
    <div v-click class="hidden"></div>
    <div class="future-system" :class="$clicks >= 1 ? 'future-system-visible' : 'future-system-hidden'">
      <div class="future-node">Lavori<br>Futuri</div>
      <div class="future-track">
        <div class="future-ring"></div>
        <div class="future-slot future-slot-top">
          <div class="future-item-shell">
            <div v-click class="future-item">Telemetria<br>granulare</div>
          </div>
        </div>
        <div class="future-slot future-slot-right-top">
          <div class="future-item-shell">
            <div v-click class="future-item">Separazione<br>del<br>parlato</div>
          </div>
        </div>
        <div class="future-slot future-slot-right-bottom">
          <div class="future-item-shell">
            <div v-click class="future-item">Contestualizzazione<br>semantica</div>
          </div>
        </div>
        <div class="future-slot future-slot-bottom-left">
          <div class="future-item-shell">
            <div v-click class="future-item">Baseline<br>adattiva</div>
          </div>
        </div>
        <div class="future-slot future-slot-left-top">
          <div class="future-item-shell">
            <div v-click class="future-item">Validazione<br>fisiologica</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
.future-orbit {
  position: relative;
  width: 100%;
  max-width: 430px;
  height: 360px;
  margin: 0 auto;
}

.future-track {
  position: absolute;
  inset: 0;
  animation: orbit-spin 75s linear infinite;
  transform-origin: 50% 50%;
}

.future-system {
  position: absolute;
  inset: 0;
  transition: transform 520ms cubic-bezier(0.22, 1, 0.36, 1), opacity 520ms cubic-bezier(0.22, 1, 0.36, 1), filter 520ms cubic-bezier(0.22, 1, 0.36, 1);
}

.future-system-hidden {
  opacity: 0;
  transform: scale(0.88);
  filter: blur(4px);
}

.future-system-visible {
  opacity: 1;
  transform: scale(1);
  filter: blur(0);
}

.future-ring {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 260px;
  height: 260px;
  transform: translate(-50%, -50%);
  border: 2px dashed var(--c-primary-200);
  border-radius: 9999px;
}

.future-node {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 110px;
  height: 110px;
  border-radius: 9999px;
  border: 2px solid var(--c-primary-400);
  background: radial-gradient(circle at 30% 30%, var(--c-primary-50), var(--c-primary-100));
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: var(--c-primary-700);
  font-weight: 700;
  box-shadow: 0 16px 28px -18px rgba(var(--c-shadow-accent-rgb), 0.8);
}

.future-slot {
  position: absolute;
  left: 50%;
  top: 50%;
}

.future-item-shell {
  display: inline-block;
  animation: orbit-counter-spin 75s linear infinite;
  transform-origin: 50% 50%;
}

.future-slot-top {
  transform: translate(-50%, calc(-50% - 150px));
}

.future-slot-right-top {
  transform: translate(calc(-50% + 143px), calc(-50% - 46px));
}

.future-slot-right-bottom {
  transform: translate(calc(-50% + 88px), calc(-50% + 121px));
}

.future-slot-bottom-left {
  transform: translate(calc(-50% - 88px), calc(-50% + 121px));
}

.future-slot-left-top {
  transform: translate(calc(-50% - 143px), calc(-50% - 46px));
}

.future-item {
  min-width: 150px;
  max-width: 190px;
  border: 1px solid var(--c-primary-300);
  border-radius: 0.8rem;
  background: rgba(255, 255, 255, 0.95);
  color: var(--c-primary-900);
  font-size: 0.86rem;
  font-weight: 600;
  line-height: 1.2rem;
  text-align: center;
  padding: 0.45rem 0.65rem;
  box-shadow: 0 12px 20px -18px rgba(var(--c-shadow-primary-rgb), 0.95);
  transition: transform 520ms cubic-bezier(0.22, 1, 0.36, 1), opacity 520ms cubic-bezier(0.22, 1, 0.36, 1), filter 520ms cubic-bezier(0.22, 1, 0.36, 1);
}

.future-item.slidev-vclick-hidden {
  opacity: 0;
  transform: scale(0.68);
  filter: blur(3px);
}

@keyframes orbit-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@keyframes orbit-counter-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(-360deg);
  }
}

@media (prefers-reduced-motion: reduce) {
  .future-track,
  .future-item-shell {
    animation: none;
  }
}
</style>

---
layout: center
class: text-center
---

# Grazie per l'attenzione

**Christian Pozzoli** christian.pozzoli@studenti.unimi.it


