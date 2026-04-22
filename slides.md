---
theme: academic
highlighter: shiki
colorSchema: light
progress: true
lineNumbers: false
coverDate: false
info: |
  ## ALESSIA Presentation
  Tesi di Laurea di Christian Pozzoli
drawings:
  persist: false
transition: slide-left
title: ALESSIA - Affective Latent Evaluation of Social Stress
class: text-center
layout: cover
---

<div class="logo-top-left">
  <img src="./images/pong-logo.png" alt="PONG Logo" />
</div>

<div class="logo-top-right">
  <img src="./images/statale-unimi-logo.png" alt="Statale Unimi Logo" />
</div>

# ALESSIA
## **A**ffective **L**atent **E**valuation of **S**ocial **S**tress in **I**nterview **A**gents

**Candidato:** Christian Pozzoli  
**Relatore:** Prof. Laura Anna Ripamonti  
**Correlatore:** Dott. Susanna Brambilla  

Anno Accademico 2024-2025

### Laurea Magistrale in Informatica

<br>

<style>
.logo-top-left {
  position: absolute;
  bottom: 80px;
  left: 40px;
  z-index: 10;
}

.logo-top-left img {
  height: 60px;
  width: auto;
  opacity: 1;
}

.logo-top-right {
  position: absolute;
  bottom: 40px;
  right: 40px;
  z-index: 10;
}

.logo-top-right img {
  height: 160px;
  width: auto;
  opacity: 1;
}
</style>

---
layout: two-cols
---

# Il Contesto

<br>

- Interazioni **VR** immersive con stimoli controllati
- Da NPC scriptati a **agenti generativi** fotorealistici
- Utente come attore **stateless**

<br>

- Nuovi scenari: training sociale, public speaking training, terapia di esposizione, colloqui simulati

::right::

<div class="flex flex-col items-center gap-5">
	<img src="./images/doubt-la-noire.png" class="rounded shadow" width="250"/>
	<img src="./images/vr.png" class="rounded shadow" width="250"/>
	<img src="./images/nvidia-ace.jpg" class="rounded shadow" width="250"/>
</div>

---
layout: two-cols
style: 'grid-template-columns: 1fr 0.6fr;'
---

# Obiettivi

<br>

<div class="mt-6 max-w-5xl mx-auto">
  <div class="text-center text-[18px] font-semibold max-w-4xl mx-auto">
    <span class="c-text-primary-700">Sviluppo di un sistema multimodale per il rilevamento non invasivo dello stress sociale in VR</span>
  </div>

  <div v-click class="hidden"></div>
  <div v-click class="hidden"></div>
  <div v-click class="hidden"></div>

  <div class="objectives-timeline mt-10">
    <div class="objectives-line"></div>
    <div class="objectives-step objectives-step-top" :class="$clicks === 0 ? 'objectives-step-current' : ($clicks > 0 ? 'objectives-step-done' : 'objectives-step-next')">
      <div class="objectives-card">Virtual Human<br>generativo</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-bottom" :class="$clicks === 1 ? 'objectives-step-current' : ($clicks > 1 ? 'objectives-step-done' : 'objectives-step-next')">
      <div class="objectives-card">Pipeline<br>multimodale</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-top" :class="$clicks === 2 ? 'objectives-step-current' : ($clicks > 2 ? 'objectives-step-done' : 'objectives-step-next')">
      <div class="objectives-card">LSTM-VAE</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
    <div class="objectives-step objectives-step-bottom" :class="$clicks >= 3 ? 'objectives-step-current' : 'objectives-step-next'">
      <div class="objectives-card">Validazione</div>
      <div class="objectives-connector"></div>
      <div class="objectives-dot"></div>
    </div>
  </div>
</div>

::right::

<div class="rq-container ml-18">
  <div class="rq-header">Research Questions</div>
  
  <div class="rq-card">
    <div class="rq-number">01</div>
    <div class="rq-content">I dati VR classificano efficacemente lo stress?</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">02</div>
    <div class="rq-content">Il reconstruction error di un LSTM-VAE rileva deviazioni dalla baseline?</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">03</div>
    <div class="rq-content">Stress fisiologico o psicologico: quale correla di più?</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">04</div>
    <div class="rq-content">Face tracking e gaze tracking: qual è il contributo relativo?</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">05</div>
    <div class="rq-content">I pattern comportamentali anticipano la risposta autonomica?</div>
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
  transition: opacity 460ms cubic-bezier(0.22, 1, 0.36, 1), transform 460ms cubic-bezier(0.22, 1, 0.36, 1);
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
  transition: transform 460ms cubic-bezier(0.22, 1, 0.36, 1), box-shadow 460ms cubic-bezier(0.22, 1, 0.36, 1), background-color 460ms cubic-bezier(0.22, 1, 0.36, 1);
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
  transition: transform 460ms cubic-bezier(0.22, 1, 0.36, 1), opacity 460ms cubic-bezier(0.22, 1, 0.36, 1), border-color 460ms cubic-bezier(0.22, 1, 0.36, 1), box-shadow 460ms cubic-bezier(0.22, 1, 0.36, 1), background-color 460ms cubic-bezier(0.22, 1, 0.36, 1);
}

.objectives-connector {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  background: var(--c-primary-400);
  z-index: 1;
  transition: background-color 460ms cubic-bezier(0.22, 1, 0.36, 1), transform 460ms cubic-bezier(0.22, 1, 0.36, 1), opacity 460ms cubic-bezier(0.22, 1, 0.36, 1);
}

.objectives-step-next {
  opacity: 0.58;
}

.objectives-step-next .objectives-card {
  transform: translateX(-50%) scale(0.95);
}

.objectives-step-next .objectives-dot {
  transform: translate(-50%, -50%) scale(0.84);
  background: var(--c-primary-400);
  box-shadow: 0 0 0 4px var(--c-primary-300);
}

.objectives-step-current {
  opacity: 1;
}

.objectives-step-current .objectives-card {
  transform: translateX(-50%) scale(1.08);
  border-color: var(--c-primary-500);
  background: linear-gradient(180deg, var(--c-white), var(--c-primary-50));
  box-shadow: 0 16px 25px -10px rgba(var(--c-shadow-accent-rgb), 0.3);
}

.objectives-step-current .objectives-dot {
  transform: translate(-50%, -50%) scale(1.5);
  background: var(--c-primary-700);
  box-shadow: 0 0 0 7px var(--c-primary-200);
}

.objectives-step-current .objectives-connector {
  background: var(--c-primary-600);
}

.objectives-step-done {
  opacity: 0.9;
}

.objectives-step-done .objectives-card {
  transform: translateX(-50%) scale(0.99);
  border-color: var(--c-primary-400);
  background: var(--c-primary-50);
}

.objectives-step-done .objectives-dot {
  transform: translate(-50%, -50%) scale(1);
  background: var(--c-primary-600);
  box-shadow: 0 0 0 5px var(--c-primary-200);
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

# Hardware, Tool e Acquisizione multimodale

<br>

<div class="grid grid-cols-2 gap-4">
  <div class="hw-grid-card border c-border-primary-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/unreal-logo.png" width="140" class="rounded-lg shrink-0" />
    <div class="w-2px h-20 hidden shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Unreal</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">MetaXR</span>
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">MetaHuman</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-primary-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/meta-quest-pro.png" width="140" class="rounded-lg shrink-0" />
    <div class="w-2px h-20 hidden shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Meta Quest Pro</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">Face Tracking</span>
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">Eye Tracking</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-primary-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/empatica.png" width="140" class="rounded-lg shrink-0" />
    <div class="w-2px h-16 hidden shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">Empatica EmbracePlus</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">EDA</span>
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">HRV</span>
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">ACC</span>
      </div>
    </div>
  </div>
  <div v-click class="hw-grid-card border c-border-primary-300 rounded-xl p-5 flex flex-row items-center gap-6">
    <img src="./images/dante-logo.png" width="140" class="rounded-lg shrink-0" />
    <div class="w-2px h-16 hidden shrink-0" />
    <div class="flex flex-1 flex-col items-center justify-center text-center">
      <div class="font-bold text-lg mb-2">DANTE</div>
      <div class="flex gap-4 text-sm justify-center">
        <span class="c-white c-bg-primary-500 rounded-full px-3.25 py-1.5 text-center">Stress Percepito</span>
      </div>
    </div>
  </div>
</div>

<style>
.hw-grid-card {
  background-color: rgba(255, 255, 255, 0.5);
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

<div class="min-h-[390px] flex flex-col">
  <div class="grid grid-cols-4 gap-3">
    <div class="vh-stressor-card shadow-md border c-border-primary-300 rounded-xl p-3 flex flex-col items-center gap-1.5 text-center">
      <carbon:user-avatar class="text-3xl c-text-primary-500" />
      <div class="font-bold text-sm">Realismo visivo</div>
      <div class="text-xs leading-snug">Interviewer fotorealistico con MetaHuman</div>
    </div>
    <div v-click class="vh-stressor-card shadow-md border c-border-primary-300 rounded-xl p-3 flex flex-col items-center gap-1.5 text-center">
      <carbon:chat class="text-3xl c-text-primary-500" />
      <div class="font-bold text-sm">Dialogo generativo</div>
      <div class="text-xs leading-snug">Conversazione contestuale e non scriptata tramite LLM</div>
    </div>
    <div v-click class="vh-stressor-card shadow-md border c-border-primary-300 rounded-xl p-3 flex flex-col items-center gap-1.5 text-center">
      <carbon:pedestrian class="text-3xl c-text-primary-500" />
      <div class="font-bold text-sm">Comunicazione non verbale</div>
      <div class="text-xs leading-snug">Prossemica, espressioni e animazioni emotive</div>
    </div>
    <div v-click class="vh-stressor-card shadow-md border c-border-primary-300 rounded-xl p-3 flex flex-col items-center gap-1.5 text-center">
      <carbon:warning-alt class="text-3xl c-text-primary-500" />
      <div class="font-bold text-sm">Tono valutativo</div>
      <div class="text-xs leading-snug">Personalità coerente progettata per indurre stress sociale</div>
    </div>
  </div>

  <div class="flex-1 flex items-center justify-center mt-4">
    <img v-if="$clicks == 0" src="https://placehold.co/400x225?text=1" class="rounded shadow" width="450"/>
    <img v-if="$clicks == 1" src="./images/google-gemini.png" class="rounded" width="350"/>
    <img v-if="$clicks == 2" src="./images/screen-hello.png" class="rounded shadow" width="450"/>
    <img v-if="$clicks == 3" src="./images/screen-office.png" class="rounded shadow" width="450"/>
  </div>
</div>

<style>
.vh-stressor-card {
  background-color: rgba(255, 255, 255, 0.5);
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
    <div class="text-s font-bold tracking-widest c-text-primary-900 mb-10 text-center w-full uppercase opacity-50">
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
  
  <div :class="$clicks >= 2 ? 'opacity-0 max-h-0 mt-0 mb-0 scale-90 pointer-events-none delay-0' : 'opacity-100 max-h-[180px] mt-10 mb-0 scale-100 delay-75'" class="flex items-center justify-between overflow-hidden transition-all duration-750 ease-[cubic-bezier(0.22,1,0.36,1)]">
    <img src="./images/jobhub.png" class="rounded shadow" width="280"/>
    <img src="./images/colloquio.png" class="rounded shadow" width="280"/>
    <img src="./images/dante-screen.png" class="rounded shadow" width="280"/>
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
<br>
<br>

<img src="./images/stress_plot_subject_eye_tracking.png" class="rounded shadow"/>

---
layout: two-cols
style: 'grid-template-columns: 1fr 2fr;'
---

<div class="h-full flex flex-col">
  <h1>Risultati<br>Face e Gaze</h1>

  <p><strong>Analisi delle Modalità</strong></p>

  <div v-click class="hidden"></div>
  <div v-click class="hidden"></div>
  <div v-click class="hidden"></div>

  <div class="flex-1 flex flex-col gap-6 justify-center items-start text-center">
    <div class="ps-option" :class="$clicks === 0 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 0 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Performance<br>Psicometriche</span>
    </div>
    <div class="ps-option" :class="$clicks === 1 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 1 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Performance<br>Fisiometriche</span>
    </div>
    <div class="ps-option" :class="$clicks === 2 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 2 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Spearman</span>
    </div>
    <div class="ps-option" :class="$clicks >= 3 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks >= 3 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Cross-correlation</span>
    </div>
  </div>
</div>

::right::

<div class="relative h-[430px] w-full max-w-4xl mx-auto mt-8">
<!--
    PERFORMANCE PSICOMETRICHE
-->
  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 0 ? 'ps-panel-active' : 'ps-panel-inactive'">
    <div class="flex justify-center gap-10">
      <div class="flex items-center gap-2">
        <div class="w-3 h-3 bar-gaze rounded"></div>
        <span class="text-xs">Gaze</span>
      </div>
      <div class="flex items-center gap-2">
        <div class="w-3 h-3 bar-face rounded"></div>
        <span class="text-xs">Face</span>
      </div>
    </div>
    <div class="relative flex gap-2">
      <div class="relative flex flex-col items-end pr-2" style="width: 30px; height: 380px;">
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 97%;">100%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 72%;">75%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 47%;">50%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 22%;">25%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: -3%;">0%</div>
      </div>
      <div class="flex-1">
        <div class="border-l c-border-neutral-300 relative border-b c-border-neutral-400 flex items-end justify-between px-10 pb-0" style="height: 380px;">
          <div class="flex items-end gap-3 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze rounded-t" style="transition-delay: 50ms" :style="{ height: $clicks === 0 ? '72.8%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face rounded-t" style="transition-delay: 150ms" :style="{ height: $clicks === 0 ? '77.9%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-3 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze rounded-t" style="transition-delay: 100ms" :style="{ height: $clicks === 0 ? '63.1%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face rounded-t" style="transition-delay: 200ms" :style="{ height: $clicks === 0 ? '71.5%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-3 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze rounded-t" style="transition-delay: 150ms" :style="{ height: $clicks === 0 ? '62.4%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face rounded-t" style="transition-delay: 250ms" :style="{ height: $clicks === 0 ? '76.1%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-3 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze rounded-t" style="transition-delay: 200ms" :style="{ height: $clicks === 0 ? '54.2%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face rounded-t" style="transition-delay: 300ms" :style="{ height: $clicks === 0 ? '67.8%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-3 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze rounded-t" style="transition-delay: 250ms" :style="{ height: $clicks === 0 ? '51.2%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face rounded-t" style="transition-delay: 350ms" :style="{ height: $clicks === 0 ? '60.8%' : '0%' }"></div>
          </div>
        </div>
        <div class="flex items-start justify-between px-10 pt-2">
          <span class="text-[10px] font-bold uppercase text-center flex-1">AP</span>
          <span class="text-[10px] font-bold uppercase text-center flex-1">F1</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>exp</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>dante</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC BIN<br>dante</span>
        </div>
      </div>
    </div>
    <p class="text-[10px] c-text-neutral-400 italic text-center -mt-3">
      Performance psicometriche: confronto tra modalità Gaze e Face.
    </p>
  </div>

<!--
    PERFORMANCE FISIOMETRICHE
-->

  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 1 ? 'ps-panel-active' : 'ps-panel-inactive'">
    <div class="flex justify-center gap-6">
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-gaze-hrv rounded-sm"></div><span class="text-[10px]">HRV Gaze</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-face-hrv rounded-sm"></div><span class="text-[10px]">HRV Face</span></div>
      <div class="flex items-center gap-2 border-l pl-4 border-gray-300"></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-gaze-scr rounded-sm"></div><span class="text-[10px]">SCR Gaze</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-face-scr rounded-sm"></div><span class="text-[10px]">SCR Face</span></div>
    </div>
    <div class="relative flex gap-2">
      <div class="relative flex flex-col items-end pr-2" style="width: 30px; height: 380px;">
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 97%;">100%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 72%;">75%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 47%;">50%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 22%;">25%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: -3%;">0%</div>
      </div>
      <div class="flex-1">
        <div class="border-l c-border-neutral-300 relative border-b c-border-neutral-400 flex items-end justify-between px-4 pb-0" style="height: 380px;">
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-hrv rounded-t" :style="{ height: $clicks === 1 ? '71.5%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-hrv rounded-t" :style="{ height: $clicks === 1 ? '74.5%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-scr rounded-t ml-1" :style="{ height: $clicks === 1 ? '52.1%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-scr rounded-t" :style="{ height: $clicks === 1 ? '54.0%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-hrv rounded-t" :style="{ height: $clicks === 1 ? '63.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-hrv rounded-t" :style="{ height: $clicks === 1 ? '69.1%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-scr rounded-t ml-1" :style="{ height: $clicks === 1 ? '50.0%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-scr rounded-t" :style="{ height: $clicks === 1 ? '54.9%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-hrv rounded-t" :style="{ height: $clicks === 1 ? '62.3%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-hrv rounded-t" :style="{ height: $clicks === 1 ? '76.1%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-scr rounded-t ml-1" :style="{ height: $clicks === 1 ? '54.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-scr rounded-t" :style="{ height: $clicks === 1 ? '71.3%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-hrv rounded-t" :style="{ height: $clicks === 1 ? '44.9%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-hrv rounded-t" :style="{ height: $clicks === 1 ? '47.6%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-scr rounded-t ml-1" :style="{ height: $clicks === 1 ? '51.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-scr rounded-t" :style="{ height: $clicks === 1 ? '54.6%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-hrv rounded-t" :style="{ height: $clicks === 1 ? '48.8%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-hrv rounded-t" :style="{ height: $clicks === 1 ? '47.5%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-scr rounded-t ml-1" :style="{ height: $clicks === 1 ? '50.8%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-scr rounded-t" :style="{ height: $clicks === 1 ? '52.9%' : '0%' }"></div>
          </div>
        </div>
        <div class="flex items-start justify-between px-4 pt-2">
          <span class="text-[9px] font-bold text-center flex-1">AP</span>
          <span class="text-[9px] font-bold text-center flex-1">F1</span>
          <span class="text-[9px] font-bold leading-tight text-center flex-1">AUC<br>EXP</span>
          <span class="text-[9px] font-bold leading-tight text-center flex-1">AUC<br>PHYSIO</span>
          <span class="text-[9px] font-bold leading-tight text-center flex-1">AUC BIN<br>PHYSIO</span>
        </div>
      </div>
    </div>
    <p class="text-[9px] c-text-neutral-400 italic text-center tracking-wider -mt-8 pt-0">
      Confronto segnali HRV vs SCR (Single Subject) su modalità Gaze e Face.
    </p>
  </div>

<!--
    SPEARMAN
-->

  <div class="absolute inset-0 flex flex-col items-center justify-center transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] transform-gpu" 
      :class="$clicks === 2 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-50 z-0 pointer-events-none'">
    <div class="max-w-4xl mb-6">
      <img src="./images/violin_Spearman_by_dtype_regime.svg" class="rounded shadow-lg" width="400"/>
    </div>
    <div class="flex items-center gap-6 max-w-4xl">
      <div class="flex-1">
        <img src="./images/violin_Spearman_HRV_by_dtype_regime.svg" class="rounded shadow-lg" width="200"/>
      </div>
      <div class="flex-1">
        <img src="./images/violin_Spearman_SCR_by_dtype_regime.svg" class="rounded shadow-lg" width="200"/>
      </div>
    </div>
  </div>

<!--
    CROSS-CORRELATION
-->

  <div class="absolute inset-0 flex items-center justify-center transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] transform-gpu" 
      :class="$clicks >= 3 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-50 z-0 pointer-events-none'">
    <div class="grid grid-cols-2 gap-2 w-full max-w-5xl items-center justify-items-center">
      <div class="bg-white rounded-lg shadow-md">
        <img src="./images/xcorr_profile_hrv_face.png" class="w-full h-auto rounded" />
      </div>
      <div class="bg-white rounded-lg shadow-md">
        <img src="./images/xcorr_profile_scr_face.png" class="w-full h-auto rounded" />
      </div>
      <div class="bg-white rounded-lg shadow-md">
        <img src="./images/xcorr_profile_eye_hrv.png" class="w-full h-auto rounded" />
      </div>
      <div class="bg-white rounded-lg shadow-md">
        <img src="./images/xcorr_profile_eye_scr.png" class="w-full h-auto rounded" />
      </div>
    </div>
  </div>

</div>

<style>
  .bar-face {
    @apply bg-orange-600;
  }
  .bar-gaze {
    @apply bg-blue-400;
  }
  .bar-face-scr {
    @apply bg-orange-600;
  }
  .bar-face-hrv {
    @apply bg-blue-500;
  }
  .bar-gaze-scr {
    @apply bg-yellow-500;
  }
  .bar-gaze-hrv {
    @apply bg-green-400;
  }
</style>

---
layout: two-cols
style: 'grid-template-columns: 1fr 2fr;'
---

<div class="h-full flex flex-col">
  <h1>Personalizzazione Modello</h1>

  <div v-click class="hidden"></div>

  <div class="flex-1 flex flex-col gap-6 justify-center items-start text-center">
    <div class="ps-option" :class="$clicks === 0 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 0 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Single-Subject<br>vs<br>Leave One Out</span>
    </div>
    <div class="ps-option" :class="$clicks === 1 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 1 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-35">Single-encoder<br>vs<br>Multi-encoder</span>
    </div>
  </div>
</div>

::right::

<div class="relative h-[430px] w-full max-w-4xl mx-auto mt-8">

  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 0 ? 'ps-panel-active' : 'ps-panel-inactive'">
    <div class="flex justify-center gap-6 mb-2">
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-gaze-single rounded"></div><span class="text-xs">Gaze (Single)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-gaze-loo rounded"></div><span class="text-xs">Gaze (LOO)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-face-single rounded"></div><span class="text-xs">Face (Single)</span></div>
      <div class="flex items-center gap-2"><div class="w-3 h-3 bar-face-loo rounded"></div><span class="text-xs">Face (LOO)</span></div>
    </div>
    <div class="relative flex gap-2">
      <div class="relative flex flex-col items-end pr-2" style="width: 30px; height: 380px;">
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 97%;">100%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 72%;">75%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 47%;">50%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 22%;">25%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: -3%;">0%</div>
      </div>
      <div class="flex-1">
        <div class="border-l c-border-neutral-300 relative border-b c-border-neutral-400 flex items-end justify-between px-4 pb-0" style="height: 380px;">
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-single rounded-t" style="transition-delay: 40ms" :style="{ height: $clicks === 0 ? '72.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-loo rounded-t" style="transition-delay: 110ms" :style="{ height: $clicks === 0 ? '70.0%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-single rounded-t" style="transition-delay: 180ms" :style="{ height: $clicks === 0 ? '77.8%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-loo rounded-t" style="transition-delay: 250ms" :style="{ height: $clicks === 0 ? '76.2%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-single rounded-t" style="transition-delay: 90ms" :style="{ height: $clicks === 0 ? '63.0%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-loo rounded-t" style="transition-delay: 160ms" :style="{ height: $clicks === 0 ? '60.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-single rounded-t" style="transition-delay: 230ms" :style="{ height: $clicks === 0 ? '71.4%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-loo rounded-t" style="transition-delay: 300ms" :style="{ height: $clicks === 0 ? '69.3%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-single rounded-t" style="transition-delay: 140ms" :style="{ height: $clicks === 0 ? '62.3%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-loo rounded-t" style="transition-delay: 210ms" :style="{ height: $clicks === 0 ? '60.3%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-single rounded-t" style="transition-delay: 280ms" :style="{ height: $clicks === 0 ? '76.1%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-loo rounded-t" style="transition-delay: 350ms" :style="{ height: $clicks === 0 ? '73.0%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-single rounded-t" style="transition-delay: 190ms" :style="{ height: $clicks === 0 ? '54.2%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-loo rounded-t" style="transition-delay: 260ms" :style="{ height: $clicks === 0 ? '52.6%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-single rounded-t" style="transition-delay: 330ms" :style="{ height: $clicks === 0 ? '67.8%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-loo rounded-t" style="transition-delay: 400ms" :style="{ height: $clicks === 0 ? '65.0%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1 h-full w-full justify-center flex-1">
            <div class="ps-bar w-3 bar-gaze-single rounded-t" style="transition-delay: 240ms" :style="{ height: $clicks === 0 ? '51.1%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-gaze-loo rounded-t" style="transition-delay: 310ms" :style="{ height: $clicks === 0 ? '51.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-single rounded-t" style="transition-delay: 380ms" :style="{ height: $clicks === 0 ? '60.7%' : '0%' }"></div>
            <div class="ps-bar w-3 bar-face-loo rounded-t" style="transition-delay: 450ms" :style="{ height: $clicks === 0 ? '60.5%' : '0%' }"></div>
          </div>
        </div>
        <div class="flex items-start justify-between px-4 pt-2">
          <span class="text-[10px] font-bold uppercase text-center flex-1">AP</span>
          <span class="text-[10px] font-bold uppercase text-center flex-1">F1</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>exp</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>dante</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC BIN<br>dante</span>
        </div>
      </div>
    </div>
    <span class="text-[10px] c-text-neutral-400 italic text-center mt-4">
      Confronto tra Single e Leave-One-Out (LOO) per Gaze e Face.
    </span>
  </div>

  <div class="ps-panel absolute inset-0 flex flex-col" :class="$clicks === 1 ? 'ps-panel-active' : 'ps-panel-inactive'">
      <div class="flex justify-center gap-6 mb-2">
        <div class="flex items-center gap-2"><div class="w-3 h-3 bar-gaze-single rounded"></div><span class="text-xs">Gaze (Single-Enc)</span></div>
        <div class="flex items-center gap-2"><div class="w-3 h-3 bar-face-single rounded"></div><span class="text-xs">Face (Single-Enc)</span></div>
        <div class="flex items-center gap-2"><div class="w-3 h-3 bar-multi rounded"></div><span class="text-xs">Gaze+Face (Multi-Enc)</span></div>
      </div>
    <div class="relative flex gap-2">
      <div class="relative flex flex-col items-end pr-2" style="width: 30px; height: 380px;">
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 97%;">100%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 72%;">75%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 47%;">50%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: 22%;">25%</div>
        <div class="text-[10px] c-text-neutral-400 absolute" style="bottom: -3%;">0%</div>
      </div>
      <div class="flex-1">
        <div class="border-l c-border-neutral-300 relative border-b c-border-neutral-400 flex items-end justify-between px-4 pb-0" style="height: 380px;">
          <div class="flex items-end gap-1.5 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze-single rounded-t" style="transition-delay: 40ms" :style="{ height: $clicks === 1 ? '68.4%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face-single rounded-t" style="transition-delay: 120ms" :style="{ height: $clicks === 1 ? '77.8%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-multi rounded-t" style="transition-delay: 200ms" :style="{ height: $clicks === 1 ? '77.1%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1.5 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze-single rounded-t" style="transition-delay: 100ms" :style="{ height: $clicks === 1 ? '59.7%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face-single rounded-t" style="transition-delay: 180ms" :style="{ height: $clicks === 1 ? '71.4%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-multi rounded-t" style="transition-delay: 260ms" :style="{ height: $clicks === 1 ? '68.5%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1.5 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze-single rounded-t" style="transition-delay: 160ms" :style="{ height: $clicks === 1 ? '62.2%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face-single rounded-t" style="transition-delay: 240ms" :style="{ height: $clicks === 1 ? '76.4%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-multi rounded-t" style="transition-delay: 320ms" :style="{ height: $clicks === 1 ? '69.4%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1.5 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze-single rounded-t" style="transition-delay: 220ms" :style="{ height: $clicks === 1 ? '55.4%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face-single rounded-t" style="transition-delay: 300ms" :style="{ height: $clicks === 1 ? '69.9%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-multi rounded-t" style="transition-delay: 380ms" :style="{ height: $clicks === 1 ? '58.1%' : '0%' }"></div>
          </div>
          <div class="flex items-end gap-1.5 h-full w-full justify-center flex-1">
            <div class="ps-bar w-4 bar-gaze-single rounded-t" style="transition-delay: 280ms" :style="{ height: $clicks === 1 ? '50.7%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-face-single rounded-t" style="transition-delay: 360ms" :style="{ height: $clicks === 1 ? '62.6%' : '0%' }"></div>
            <div class="ps-bar w-4 bar-multi rounded-t" style="transition-delay: 440ms" :style="{ height: $clicks === 1 ? '52.7%' : '0%' }"></div>
          </div>
        </div>
        <div class="flex items-start justify-between px-4 pt-2">
          <span class="text-[10px] font-bold uppercase text-center flex-1">AP</span>
          <span class="text-[10px] font-bold uppercase text-center flex-1">F1</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>exp</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC<br>dante</span>
          <span class="text-[10px] font-bold uppercase leading-none text-center flex-1">AUC BIN<br>dante</span>
        </div>
      </div>
    </div>
      <span class="text-[10px] c-text-neutral-400 mt-4 italic text-center">
        Confronto tra varianti Unimodali e architettura Multimodale (Late-Fusion).
      </span>
    </div>
</div>

<style>
  .bar-face-single {
    @apply bg-amber-400
  }
  .bar-face-loo {
    @apply bg-red-600
  }
  .bar-gaze-single {
    @apply bg-cyan-300
  }
  .bar-gaze-loo {
    @apply bg-teal-700
  }
  .bar-multi {
    @apply bg-purple-700
  }
</style>

---
layout: two-cols
style: 'grid-template-columns: 0.8fr 2.2fr;'
---

<div class="h-full flex flex-col">
  <h1>Dinamiche Temporali</h1>

  <div v-click class="hidden"></div>
  <div v-click class="hidden"></div>

  <div class="flex-1 flex flex-col gap-6 justify-center items-start text-center">
    <div class="ps-option" :class="$clicks === 0 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 0 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-25">Face</span>
    </div>
    <div class="ps-option" :class="$clicks === 1 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks === 1 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-25">Gaze</span>
    </div>
    <div class="ps-option" :class="$clicks >= 2 ? 'ps-option-active' : 'ps-option-idle'">
      <span class="ps-rail" :class="$clicks >= 2 ? 'ps-rail-active' : 'ps-rail-idle'"></span>
      <span class="ps-label min-w-25">Fixations</span>
    </div>
  </div>
</div>

<!--
- **Anticipazione**: Il modello rileva anomalie facciali e oculari **1.5 - 2 secondi prima** della risposta fisiologica.
- **Validazione**: L'errore di ricostruzione precede i picchi di EDA (sudorazione).
- **Implicazione**: La biometria "esterna" (volto) è un segnale di allerta precoce rispetto alla risposta del sistema nervoso autonomo.
-->

::right::

<div class="relative h-full w-full max-w-4xl mx-auto">
  <div class="absolute inset-0 flex items-center justify-center transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] transform-gpu" 
      :class="$clicks == 0 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-25 z-0 pointer-events-none'">
        <img src="./images/stress_indices_comparison_face.png" class="w-full h-auto rounded shadow-xl" />    
  </div>
  <div class="absolute inset-0 flex items-center justify-center transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] transform-gpu" 
      :class="$clicks == 1 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-25 z-0 pointer-events-none'">
        <img src="./images/stress_indices_comparison_eye.png" class="w-full h-auto rounded shadow-xl" />
  </div>
  <div class="absolute inset-0 flex items-center justify-center transition-all duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] transform-gpu" 
      :class="$clicks >= 2 ? 'opacity-100 scale-100 z-20' : 'opacity-0 scale-25 z-0 pointer-events-none'">
        <img src="./images/gaze_stress_global_summary_dante.png" class="w-full h-auto rounded shadow-xl" />
  </div>
</div>

---
layout: two-cols
---

# Conclusioni

<div class="rq-container mr-16 -mt-5">
  <div class="rq-card">
    <div class="rq-number">01</div>
    <div class="rq-content">La telemetria da VR classifica efficacemente lo stress sociale in modo non invasivo</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">02</div>
    <div class="rq-content">Il reconstruction error rileva deviazioni dal baseline, con efficacia soggetto-dipendente</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">03</div>
    <div class="rq-content">La dimensione psicologica correla più di quella fisiologica</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">04</div>
    <div class="rq-content">Il face tracking è il segnale più discriminativo</div>
  </div>
  
  <div class="rq-card">
    <div class="rq-number">05</div>
    <div class="rq-content">Il modello anticipa la risposta autonomica</div>
  </div>
</div>

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
            <div v-click class="future-item">Separazione<br>del parlato</div>
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

**Christian Pozzoli**

christian.pozzoli@studenti.unimi.it


