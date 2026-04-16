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
layout: center
---

## Il Contesto e l'Obiettivo

L'evoluzione delle interfacce digitali sta portando a un passaggio cruciale: dalle interazioni puramente transazionali a sistemi **affectively-aware**. 

Il cuore di questa ricerca è lo sviluppo di un modello multimodale capace di rilevare lo **stress sociale** in ambienti di Realtà Virtuale. Il sistema non si limita a una classificazione statica, ma identifica attivamente le **deviazioni dal comportamento "normale"** dell'utente, utilizzando una baseline personalizzata per mappare le anomalie durante l'interazione.

---
layout: center
---

## Domande di Ricerca (RQ)

L'indagine si focalizza sulla comprensione di quanto i segnali biometrici non verbali possano essere predittivi dello stato emotivo. In particolare, ci si interroga sull'efficacia comparativa del face tracking e dell'eye tracking come indicatori dello stress sociale. A livello metodologico, la sfida risiede nel validare l'utilizzo dell'errore di ricostruzione generato da un modello LSTM-VAE come metrica quantitativa per identificare tali stati latenti, verificando se una deviazione statistica dai dati di riposo corrisponda effettivamente a un'insorgenza di stress durante un colloquio di lavoro simulato.

---
layout: two-cols
---

# Hardware e Acquisizione

**Setup Multimodale**

- **Meta Quest Pro**: 
  - Face Tracking (espressioni e muscoli facciali)
  - Eye Tracking (fissazioni, dilatazione pupillare)
- **Empatica EmbracePlus**: 
  - Segnali Fisiologici
  - EDA (Attività Elettrodermica)
  - HRV (Variabilità della Frequenza Cardiaca)

::right::

<div class="flex flex-col items-center gap-20">
  <img class="ml-20" src="https://immersive-display.com/3936-large_default/meta-quest-pro.jpg" width="200" />
<img class="ml--20" src="https://www.empatica.com/_next/image/?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fggwhkgro%2Fproduction%2F52fdee6020f983db8a0546027d653d8643cace3a-1380x1085.png&w=1200&q=75" width="200" />
</div>

---

# Ambiente Virtuale e Agente

**Unreal Engine 5.4 & MetaHuman**

- **Realismo Visivo**: Intervistatore fotorealistico per massimizzare la presenza sociale.
- **Intelligenza Artificiale**: Integrazione con **Gemini 2.5 Flash-Lite**.
- **Dialogo Generativo**: Conversazioni coerenti, non scriptate, capaci di adattarsi alle risposte dell'utente in tempo reale.
- **Obiettivo**: Creare uno stressor sociale credibile e immersivo.

---

# L'Intervistatore: Comunicazione Non Verbale

**Gestione dello Stress tramite l'Agente**

- **Prossemica Reattiva**: L'agente modifica la distanza e la posizione in base all'interazione.
- **Linguaggio del Corpo**: Utilizzo di micro-espressioni e gestualità per influenzare lo stato emotivo dell'utente.
- **Feedback Visivo**: Risposte non verbali immediate che fungono da stimolo per provocare o mitigare lo stress sociale.

---

# Struttura del Colloquio

**Fasi dell'Esperimento (10-15 minuti)**

1. **Presentazione**: Accoglienza e calibrazione iniziale.
2. **Esperienze Passate**: Domande biografiche a basso carico cognitivo.
3. **Scenario STAR**: Metodo strutturato (Situation, Task, Action, Result) per indurre carico cognitivo e stress prestazionale.
4. **Feedback Finale**: Chiusura dell'interazione e debriefing.

---

# Architettura del Modello

**LSTM-VAE (Long Short-Term Memory Variational Autoencoder)**

1. **Fase di Baseline**: Il modello apprende la firma biometrica dell'utente in stato di riposo.
2. **Compressione Latente**: I dati vengono proiettati in uno spazio latente per catturare le caratteristiche essenziali.
3. **Errore di Ricostruzione**: 
   - Durante il colloquio, il modello tenta di ricostruire i dati in ingresso.
   - Un **alto errore di ricostruzione** indica una deviazione dalla baseline $\rightarrow$ **Stress rilevato**.

---

# Risultati: Face vs Gaze

**Analisi delle Modalità**

- **Face Tracking**: Si è dimostrato l'indicatore più **robusto e coerente**. Le micro-espressioni catturate dal visore sono correlate direttamente all'insorgenza dello stress.
- **Gaze Tracking**: Risultato meno affidabile come predittore unico, influenzato fortemente dal compito visivo (guardare l'intervistatore) più che dallo stato emotivo latente.
- **Performance**: Il modello basato sul volto ha raggiunto un **ROC-AUC di 0.7614**.

---

# Personalizzazione del Modello

**Single-Subject vs Leave-One-Out**

- **Soggettività dello Stress**: La risposta fisiologica e comportamentale varia drasticamente tra individui.
- **Risultati**: 
  - Il regime **Single-Subject** (modello addestrato sull'utente specifico) è nettamente superiore.
  - Il regime generalista fallisce nel catturare le sfumature individuali, confermando che lo stress sociale non può essere modellato in modo univoco per tutti.

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
