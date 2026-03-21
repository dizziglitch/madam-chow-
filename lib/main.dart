<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Madam Chow — Menu Master</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
:root{--crimson:#8B1A1A;--gold:#C9A84C;--cream:#FAF6EF;--ink:#1A1209;--muted:#7A6E60;--border:#E8DDD0;--green:#2D6A4F;}
*{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'DM Sans',sans-serif;background:var(--cream);color:var(--ink);min-height:100vh;}

.popup-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.78);display:flex;align-items:center;justify-content:center;z-index:1000;}
.popup-box{background:white;border-radius:20px;padding:36px 28px;width:92%;max-width:400px;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,0.3);animation:slideUp 0.4s ease;}
.popup-box p{color:var(--muted);font-size:0.88rem;margin-bottom:20px;line-height:1.5;}
.popup-input{width:100%;padding:13px 16px;border:1.5px solid var(--border);border-radius:10px;font-size:1rem;font-family:'DM Sans',sans-serif;outline:none;margin-bottom:16px;transition:border-color 0.2s;}
.popup-input:focus{border-color:var(--crimson);}
.popup-btn{width:100%;padding:14px;background:var(--crimson);color:white;border:none;border-radius:10px;font-size:1rem;font-family:'DM Sans',sans-serif;font-weight:600;cursor:pointer;}

/* PRONOUNCE POPUP */
.pronounce-popup{position:fixed;inset:0;background:rgba(0,0,0,0.6);display:flex;align-items:center;justify-content:center;z-index:2000;}
.pronounce-box{background:white;border-radius:16px;padding:28px 24px;width:88%;max-width:360px;text-align:center;animation:slideUp 0.3s ease;}
.pronounce-box h3{font-family:'Playfair Display',serif;color:var(--crimson);margin-bottom:8px;font-size:1.2rem;}
.pronounce-phonetic{font-size:1.3rem;color:var(--ink);font-style:italic;margin:12px 0;padding:14px;background:var(--cream);border-radius:10px;letter-spacing:1px;}
.pronounce-speak-btn{padding:10px 28px;background:var(--crimson);color:white;border:none;border-radius:8px;font-size:0.9rem;cursor:pointer;margin:6px 4px;font-family:'DM Sans',sans-serif;}
.pronounce-close-btn{padding:10px 28px;background:var(--border);color:var(--ink);border:none;border-radius:8px;font-size:0.9rem;cursor:pointer;margin:6px 4px;font-family:'DM Sans',sans-serif;}

.detail-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.6);display:flex;align-items:flex-end;justify-content:center;z-index:999;}
.detail-box{background:white;border-radius:20px 20px 0 0;padding:24px 22px 44px;width:100%;max-width:600px;max-height:88vh;overflow-y:auto;animation:slideUp 0.3s ease;position:relative;}
.detail-handle{width:40px;height:4px;background:var(--border);border-radius:2px;margin:0 auto 18px;}
.detail-name{font-family:'Playfair Display',serif;font-size:1.35rem;color:var(--crimson);margin-bottom:4px;}
.detail-cat{font-size:0.72rem;text-transform:uppercase;letter-spacing:2px;color:var(--gold);margin-bottom:12px;}
.detail-price-big{font-size:1.5rem;font-weight:700;color:var(--crimson);margin-bottom:18px;}
.detail-section{margin-bottom:14px;}
.detail-section-title{font-size:0.68rem;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:6px;font-weight:600;}
.allergen-chip{display:inline-block;padding:3px 10px;border-radius:20px;font-size:0.73rem;font-weight:500;background:#FFF3E0;color:#E65100;margin:2px;}
.close-detail{position:absolute;top:18px;right:18px;background:var(--border);border:none;border-radius:50%;width:30px;height:30px;cursor:pointer;font-size:0.9rem;}
.pronounce-btn{display:inline-flex;align-items:center;gap:6px;padding:7px 16px;border:1.5px solid var(--gold);border-radius:20px;background:white;color:var(--gold);font-size:0.8rem;cursor:pointer;font-family:'DM Sans',sans-serif;font-weight:500;margin-bottom:14px;transition:all 0.2s;}
.pronounce-btn:hover{background:var(--gold);color:white;}

header{background:var(--crimson);color:white;text-align:center;padding:22px 20px 18px;position:relative;overflow:hidden;}
header::before{content:'';position:absolute;inset:0;background:repeating-linear-gradient(45deg,transparent,transparent 8px,rgba(255,255,255,0.03) 8px,rgba(255,255,255,0.03) 16px);}
.header-logo{position:relative;display:inline-block;margin-bottom:4px;}
header p{font-size:0.75rem;opacity:0.7;position:relative;letter-spacing:2px;text-transform:uppercase;}
.user-greeting{font-size:0.8rem;opacity:0.85;position:relative;font-style:italic;margin-top:2px;}

.tabs{display:flex;background:white;border-bottom:2px solid var(--border);overflow-x:auto;scrollbar-width:none;}
.tabs::-webkit-scrollbar{display:none;}
.tab{flex-shrink:0;padding:12px 14px;font-size:0.74rem;font-weight:500;letter-spacing:0.5px;text-transform:uppercase;cursor:pointer;border-bottom:3px solid transparent;color:var(--muted);transition:all 0.2s;background:none;border-top:none;border-left:none;border-right:none;white-space:nowrap;}
.tab.active{color:var(--crimson);border-bottom-color:var(--crimson);}
.content{max-width:760px;margin:0 auto;padding:16px 14px 60px;}

.section-title{font-family:'Playfair Display',serif;font-size:1.15rem;color:var(--crimson);margin:22px 0 8px;padding-bottom:5px;border-bottom:1px solid var(--border);}
.subsection-title{font-size:0.7rem;text-transform:uppercase;letter-spacing:2px;color:var(--gold);margin:12px 0 6px;font-weight:600;}
.item-card{background:white;border:1px solid var(--border);border-radius:10px;padding:12px 14px;margin-bottom:7px;display:flex;justify-content:space-between;align-items:flex-start;gap:10px;cursor:pointer;transition:all 0.2s;}
.item-card:hover{box-shadow:0 4px 16px rgba(139,26,26,0.1);border-color:var(--crimson);transform:translateY(-1px);}
.item-name{font-family:'Playfair Display',serif;font-size:0.95rem;font-weight:700;margin-bottom:2px;}
.item-desc{font-size:0.78rem;color:var(--muted);line-height:1.4;}
.item-price{font-weight:700;color:var(--crimson);font-size:0.85rem;white-space:nowrap;flex-shrink:0;}
.badge{display:inline-block;font-size:0.62rem;padding:1px 6px;border-radius:20px;margin-right:3px;font-weight:500;}
.badge-veg{background:#E8F5E9;color:#2D6A4F;}
.badge-sig{background:#FFF3E0;color:#E65100;}
.badge-spicy{background:#FFEAEA;color:#8B1A1A;}
.tap-hint{font-size:0.65rem;color:var(--gold);margin-top:3px;}
.kcal{font-size:0.68rem;color:var(--muted);margin-left:5px;}
.gst-notice{background:#FFF8E8;border:1px solid var(--gold);border-radius:8px;padding:10px 14px;font-size:0.78rem;color:#7A5A00;margin-bottom:16px;display:flex;gap:8px;}
.search-wrap{position:relative;margin-bottom:14px;}
.search-input{width:100%;padding:12px 16px 12px 40px;border:1.5px solid var(--border);border-radius:10px;font-size:0.9rem;font-family:'DM Sans',sans-serif;background:white;color:var(--ink);outline:none;transition:border-color 0.2s;}
.search-input:focus{border-color:var(--crimson);}
.search-icon{position:absolute;left:13px;top:50%;transform:translateY(-50%);color:var(--muted);}

/* IMPOSSIBLE GUEST */
.ig-card{background:white;border-radius:14px;padding:18px;box-shadow:0 4px 20px rgba(0,0,0,0.06);margin-bottom:12px;cursor:pointer;border:1.5px solid var(--border);transition:all 0.2s;}
.ig-card:hover{border-color:var(--crimson);}
.ig-demand{font-family:'Playfair Display',serif;font-size:0.98rem;color:var(--ink);margin-bottom:6px;}
.ig-tags{display:flex;flex-wrap:wrap;gap:5px;margin-bottom:8px;}
.ig-tag{padding:2px 9px;border-radius:20px;font-size:0.7rem;font-weight:500;background:var(--cream);color:var(--muted);border:1px solid var(--border);}
.ig-answer{display:none;margin-top:12px;padding-top:12px;border-top:1px solid var(--border);}
.ig-answer.show{display:block;animation:fadeIn 0.3s ease;}
.ig-dish{font-weight:700;color:var(--crimson);font-family:'Playfair Display',serif;font-size:1rem;}
.ig-reason{font-size:0.83rem;color:var(--muted);line-height:1.5;margin-top:4px;}
.ig-mod{background:#E8F5E9;border-radius:8px;padding:9px 11px;font-size:0.8rem;color:#1B4332;margin-top:8px;border-left:3px solid var(--green);}

/* QUIZ */
.cat-chips{display:flex;gap:7px;overflow-x:auto;padding-bottom:4px;scrollbar-width:none;margin-bottom:14px;flex-wrap:wrap;}
.cat-chip{flex-shrink:0;padding:6px 12px;border-radius:20px;border:1.5px solid var(--border);background:white;font-size:0.75rem;cursor:pointer;font-family:'DM Sans',sans-serif;font-weight:500;color:var(--muted);transition:all 0.2s;}
.cat-chip.active{background:var(--crimson);color:white;border-color:var(--crimson);}
.quiz-type-btns{display:flex;gap:10px;margin-bottom:18px;flex-wrap:wrap;}
.quiz-type-btn{flex:1;min-width:130px;padding:14px 10px;border:1.5px solid var(--border);border-radius:12px;background:white;cursor:pointer;font-family:'DM Sans',sans-serif;text-align:center;transition:all 0.2s;}
.quiz-type-btn.active{border-color:var(--crimson);background:#FDF5F5;}
.qt-emoji{font-size:1.4rem;display:block;margin-bottom:4px;}
.qt-label{font-size:0.8rem;font-weight:600;color:var(--ink);}
.qt-desc{font-size:0.68rem;color:var(--muted);margin-top:2px;}
.start-btn,.next-btn{display:block;margin:16px auto;padding:13px 34px;background:var(--crimson);color:white;border:none;border-radius:10px;font-size:0.95rem;font-family:'DM Sans',sans-serif;font-weight:600;cursor:pointer;transition:background 0.2s;}
.start-btn:hover,.next-btn:hover{background:#6B1313;}

/* AI LOADING */
.ai-loading{text-align:center;padding:40px 20px;}
.ai-loading-spinner{width:48px;height:48px;border:3px solid var(--border);border-top-color:var(--crimson);border-radius:50%;animation:spin 0.8s linear infinite;margin:0 auto 16px;}
.ai-loading p{color:var(--muted);font-size:0.88rem;line-height:1.6;}
.ai-loading .ai-dots span{display:inline-block;animation:dot 1.4s infinite;font-size:1.2rem;}
.ai-loading .ai-dots span:nth-child(2){animation-delay:0.2s;}
.ai-loading .ai-dots span:nth-child(3){animation-delay:0.4s;}
@keyframes spin{to{transform:rotate(360deg)}}
@keyframes dot{0%,80%,100%{opacity:0}40%{opacity:1}}
.quiz-card{background:white;border-radius:14px;padding:22px 18px;box-shadow:0 4px 20px rgba(0,0,0,0.07);margin-bottom:14px;}
.quiz-progress{display:flex;justify-content:space-between;font-size:0.78rem;color:var(--muted);margin-bottom:8px;}
.progress-bar{height:5px;background:var(--border);border-radius:3px;margin-bottom:16px;overflow:hidden;}
.progress-fill{height:100%;background:var(--gold);border-radius:3px;transition:width 0.4s ease;}
.quiz-hint{font-size:0.7rem;color:var(--gold);text-transform:uppercase;letter-spacing:1.5px;margin-bottom:10px;font-weight:600;}
.quiz-question{font-family:'Playfair Display',serif;font-size:1.05rem;margin-bottom:16px;line-height:1.5;color:var(--ink);}
.quiz-scenario{background:#FDF5F5;border-radius:10px;padding:14px;margin-bottom:14px;border-left:3px solid var(--crimson);}
.quiz-scenario p{font-size:0.84rem;color:var(--ink);line-height:1.6;font-style:italic;}
.options{display:grid;gap:8px;}
.option-btn{padding:12px 14px;border:1.5px solid var(--border);border-radius:10px;text-align:left;font-size:0.87rem;font-family:'DM Sans',sans-serif;cursor:pointer;background:white;color:var(--ink);transition:all 0.15s;line-height:1.4;}
.option-btn:hover:not(:disabled){border-color:var(--crimson);background:#FDF5F5;}
.option-btn.correct{background:#E8F5E9;border-color:#2D6A4F;color:#1B4332;}
.option-btn.wrong{background:#FFEAEA;border-color:#8B1A1A;color:#5c0f0f;}
.option-btn:disabled{cursor:default;}
.result-box{margin-top:12px;padding:12px 14px;border-radius:8px;font-size:0.84rem;line-height:1.5;animation:fadeIn 0.3s ease;}
.result-box.correct{background:#E8F5E9;color:#1B4332;border-left:4px solid #2D6A4F;}
.result-box.wrong{background:#FFEAEA;color:#5c0f0f;border-left:4px solid #8B1A1A;}
.score-card{text-align:center;background:white;border-radius:14px;padding:36px 22px;box-shadow:0 4px 20px rgba(0,0,0,0.07);}
.score-big{font-family:'Playfair Display',serif;font-size:3.5rem;color:var(--crimson);line-height:1;margin-bottom:4px;}
.score-label{font-size:0.8rem;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:12px;}
.score-msg{font-family:'Playfair Display',serif;font-style:italic;font-size:1rem;color:var(--ink);margin-bottom:6px;line-height:1.6;}
.score-by{font-size:0.85rem;color:var(--gold);font-weight:600;margin-bottom:22px;}

/* FLASHCARD */
.flashcard-wrap{perspective:1000px;cursor:pointer;margin-bottom:18px;height:210px;}
.flashcard-inner{position:relative;height:100%;transform-style:preserve-3d;transition:transform 0.5s ease;border-radius:16px;}
.flashcard-wrap.flipped .flashcard-inner{transform:rotateY(180deg);}
.fc-front,.fc-back{position:absolute;inset:0;backface-visibility:hidden;border-radius:16px;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:22px;text-align:center;box-shadow:0 6px 24px rgba(0,0,0,0.1);}
.fc-front{background:var(--crimson);color:white;}
.fc-back{background:white;color:var(--ink);transform:rotateY(180deg);border:1px solid var(--border);}
.fc-label{font-size:0.66rem;text-transform:uppercase;letter-spacing:2px;opacity:0.65;margin-bottom:8px;}
.fc-name{font-family:'Playfair Display',serif;font-size:1.3rem;margin-bottom:6px;}
.fc-sub{font-size:0.75rem;opacity:0.65;}
.fc-desc{font-size:0.84rem;color:var(--muted);line-height:1.5;margin-bottom:8px;}
.fc-price{font-size:1rem;font-weight:700;color:var(--crimson);}
.fc-nav{display:flex;gap:10px;justify-content:center;align-items:center;}
.nav-btn{padding:9px 20px;border:1.5px solid var(--border);border-radius:8px;background:white;font-family:'DM Sans',sans-serif;font-size:0.85rem;cursor:pointer;transition:all 0.2s;color:var(--ink);}
.nav-btn:hover{border-color:var(--crimson);color:var(--crimson);}
.fc-counter{font-size:0.8rem;color:var(--muted);}

@keyframes fadeIn{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:none}}
@keyframes slideUp{from{opacity:0;transform:translateY(30px)}to{opacity:1;transform:none}}
.fade-in{animation:fadeIn 0.3s ease;}
.hidden{display:none;}
</style>
</head>
<body>

<!-- NAME POPUP -->
<div class="popup-overlay" id="name-popup">
  <div class="popup-box">
    <div style="font-family:'Playfair Display',Georgia,serif;font-size:2rem;font-weight:700;color:#8B1A1A;margin-bottom:16px;letter-spacing:1px">Madam Chow</div>
    <p>Welcome! Before we begin your journey — what shall we call you?</p>
    <input type="text" class="popup-input" id="user-name-input" placeholder="Enter your name..." maxlength="30">
    <button class="popup-btn" onclick="saveName()">Begin the Experience ✨</button>
  </div>
</div>

<!-- PRONOUNCE POPUP -->
<div class="pronounce-popup hidden" id="pronounce-popup">
  <div class="pronounce-box">
    <h3 id="pp-name">—</h3>
    <div style="font-size:0.75rem;color:var(--muted);margin-bottom:6px;text-transform:uppercase;letter-spacing:1px">Pronunciation Guide</div>
    <div class="pronounce-phonetic" id="pp-phonetic">—</div>
    <div style="font-size:0.75rem;color:var(--muted);margin-bottom:14px">Say it out loud: read each part slowly</div>
    <button class="pronounce-speak-btn" onclick="speakNow()">🔊 Speak it</button>
    <button class="pronounce-close-btn" onclick="closePronounce()">Close</button>
  </div>
</div>

<!-- DETAIL POPUP -->
<div class="detail-overlay hidden" id="detail-popup" onclick="closeDetailOverlay(event)">
  <div class="detail-box" id="detail-box">
    <div class="detail-handle"></div>
    <button class="close-detail" onclick="closeDetailBtn()">✕</button>
    <div id="detail-content"></div>
  </div>
</div>

<header>
  <div style="font-family:'Playfair Display',Georgia,serif;font-size:1.8rem;font-weight:700;color:white;letter-spacing:1px;position:relative">Madam Chow</div>
</header>

<div class="tabs">
  <button class="tab active" onclick="switchTab('browse')">📖 Browse</button>
  <button class="tab" onclick="switchTab('flashcard')">🃏 Cards</button>
  <button class="tab" onclick="switchTab('quiz')">🧠 Quiz</button>
  <button class="tab" onclick="switchTab('impossible')">😈 Impossible Guest</button>
</div>

<div class="content">
  <div id="tab-browse">
    <div class="search-wrap">
      <span class="search-icon">🔍</span>
      <input type="text" class="search-input" id="search-input" placeholder="Search any dish, ingredient or drink..." oninput="doSearch()">
    </div>
    <div id="browse-results"></div>
    <div id="browse-all"></div>
  </div>

  <div id="tab-flashcard" class="hidden">
    <div class="cat-chips" id="fc-cats"></div>
    <div class="flashcard-wrap" id="fc-wrap" onclick="flipCard()">
      <div class="flashcard-inner">
        <div class="fc-front">
          <div class="fc-label">Tap to reveal</div>
          <div class="fc-name" id="fc-name">—</div>
          <div class="fc-sub" id="fc-sub">—</div>
        </div>
        <div class="fc-back">
          <div class="fc-label">Key Ingredients</div>
          <div class="fc-desc" id="fc-desc">—</div>
          <div class="fc-price" id="fc-price">—</div>
        </div>
      </div>
    </div>
    <div class="fc-nav">
      <button class="nav-btn" onclick="prevCard()">← Prev</button>
      <span class="fc-counter" id="fc-counter">1/1</span>
      <button class="nav-btn" onclick="nextCard()">Next →</button>
    </div>
  </div>

  <div id="tab-quiz">
    <div id="quiz-setup">
      <p style="text-align:center;color:var(--muted);font-size:0.84rem;margin-bottom:12px">Choose quiz type — always 10 questions</p>
      <div class="quiz-type-btns">
        <div class="quiz-type-btn active" onclick="selectQuizType(this,'classic')">
          <span class="qt-emoji">🧠</span>
          <div class="qt-label">Classic Quiz</div>
          <div class="qt-desc">Fresh questions every time</div>
        </div>
        <div class="quiz-type-btn" onclick="selectQuizType(this,'story')">
          <span class="qt-emoji">🎭</span>
          <div class="qt-label">Story Mode</div>
          <div class="qt-desc">Real table scenarios</div>
        </div>
        <div class="quiz-type-btn" onclick="selectQuizType(this,'impossible')">
          <span class="qt-emoji">😈</span>
          <div class="qt-label">Impossible Guest</div>
          <div class="qt-desc">Tricky guest scenarios</div>
        </div>
      </div>
      <p style="text-align:center;color:var(--muted);font-size:0.8rem;margin-bottom:10px">Filter by category (optional)</p>
      <div class="cat-chips" id="quiz-cats" style="justify-content:center"></div>
      <button class="start-btn" onclick="startQuiz()">Start Quiz 🚀</button>
    </div>
    <div id="quiz-game" class="hidden"></div>
  </div>

  <div id="tab-impossible" class="hidden">
    <div style="text-align:center;margin-bottom:18px">
      <div style="font-size:2rem;margin-bottom:6px">😈</div>
      <div style="font-family:'Playfair Display',serif;font-size:1.2rem;color:var(--crimson);margin-bottom:4px">Impossible Guest Mode</div>
      <div style="font-size:0.8rem;color:var(--muted);margin-bottom:14px">Tap each card to reveal the perfect solution</div>
      <button onclick="generateIGCards()" style="padding:9px 22px;background:var(--crimson);color:white;border:none;border-radius:20px;font-family:'DM Sans',sans-serif;font-size:0.85rem;cursor:pointer;font-weight:500">🔄 Generate New Scenarios</button>
    </div>
    <div id="ig-list"></div>
  </div>
</div>

<script>
// ===================== MENU DATA =====================
const ALL = [
  {name:"Walk in the forest",cat:"Dimsum",sub:"Steamed",desc:"Mélange of mushroom, spinach wrapper, cream",ingredients:["mushroom","spinach","cream cheese","truffle"],allergens:["Gluten","Milk"],price:"₹1050",kcal:401,veg:true,pronounce:"walk in the forest"},
  {name:"Golden crown",cat:"Dimsum",sub:"Steamed",desc:"Philadelphia cream cheese, garlic flakes, garlic chives",ingredients:["Philadelphia cream cheese","garlic flakes","garlic chives"],allergens:["Gluten","Milk"],price:"₹1050",kcal:655,veg:true,pronounce:"golden crown"},
  {name:"Fortune funguo",cat:"Dimsum",sub:"Steamed",desc:"Hazelnut, morel, celery, carrot",ingredients:["hazelnut","morel mushroom","celery","carrot"],allergens:["Nuts","Gluten"],price:"₹1050",kcal:420,veg:true,pronounce:"for-chun fung-wo"},
  {name:"Crimson tide",cat:"Dimsum",sub:"Steamed",desc:"Quinoa, edamame, silken tofu, chilli jam",ingredients:["quinoa","edamame","silken tofu","chilli jam"],allergens:["Soy","Gluten"],price:"₹1050",kcal:371,veg:true,pronounce:"krim-zon tide"},
  {name:"Napa Valley",cat:"Dimsum",sub:"Steamed",desc:"Asparagus, babycorn, water chestnut, bird eye chilli",ingredients:["asparagus","babycorn","water chestnut","bird eye chilli"],allergens:["Gluten"],price:"₹1050",kcal:376,veg:true,pronounce:"nah-pa val-ee"},
  {name:"The whole truth",cat:"Dimsum",sub:"Steamed",desc:"Baby bok choy, prawn, tobiko",ingredients:["baby bok choy","prawn","tobiko"],allergens:["Shellfish","Fish","Gluten"],price:"₹1350",kcal:312,pronounce:"the whole truth"},
  {name:"Hargao three Kingdoms",cat:"Dimsum",sub:"Steamed",desc:"Shrimp, water chestnut",ingredients:["shrimp","water chestnut","wheat starch"],allergens:["Shellfish","Gluten"],price:"₹1350",kcal:358,pronounce:"har-gow three king-doms"},
  {name:"Harmony",cat:"Dimsum",sub:"Steamed",desc:"Chicken, prawn, green onions, wheat wrapper",ingredients:["chicken","prawn","green onions","wheat wrapper"],allergens:["Gluten","Shellfish","Egg"],price:"₹1350",kcal:398,pronounce:"har-mo-nee"},
  {name:"Orient tide",cat:"Dimsum",sub:"Steamed",desc:"Blue pea flower, rock lobster, shaved truffle, asparagus",ingredients:["blue pea flower","rock lobster","shaved truffle","asparagus"],allergens:["Shellfish","Gluten"],price:"₹1500",kcal:416,sig:true,pronounce:"or-ee-ent tide"},
  {name:"Mala medley",cat:"Dimsum",sub:"Steamed",desc:"Sichuan chicken, pickled wood ear fungus",ingredients:["chicken","pickled wood ear fungus","Sichuan mala spice"],allergens:["Gluten","Soy"],price:"₹1250",kcal:334,spicy:true,pronounce:"mah-la med-lee"},
  {name:"Canton core",cat:"Dimsum",sub:"Steamed",desc:"Chicken, pickled young ginger, garlic chives",ingredients:["chicken","pickled young ginger","garlic chives"],allergens:["Gluten","Egg"],price:"₹1250",kcal:460,pronounce:"can-ton core"},
  {name:"Xiaolongbao",cat:"Dimsum",sub:"Steamed",desc:"Shanghainese pork soup dumpling, goji berry",ingredients:["pork","goji berry","pork gelatin broth","wheat wrapper"],allergens:["Gluten","Pork"],price:"₹1500",kcal:317,sig:true,pronounce:"shiao-long-bao"},
  {name:"Yumi bao",cat:"Dimsum",sub:"Bao",desc:"Sweet corn, chilli, peppers, cream cheese",ingredients:["sweet corn","chilli","mixed peppers","cream cheese"],allergens:["Gluten","Milk"],price:"₹1050",kcal:432,veg:true,pronounce:"you-me bao"},
  {name:"Volcano bao",cat:"Dimsum",sub:"Bao",desc:"BBQ chicken, ash bao, 24k gold",ingredients:["BBQ chicken","activated charcoal bao","edible 24k gold leaf"],allergens:["Gluten","Soy"],price:"₹1250",kcal:410,sig:true,pronounce:"vol-kay-no bao"},
  {name:"Sheng jian bao",cat:"Dimsum",sub:"Bao",desc:"Sesame crust, pan seared pork buns, caramelized onion",ingredients:["pork","caramelized onion","sesame seeds","wheat dough"],allergens:["Gluten","Pork","Sesame"],price:"₹1500",kcal:545,pronounce:"shung jee-en bao"},
  {name:"Lychee Bonsai",cat:"Dimsum",sub:"Baked & Fried",desc:"Shrimp, mozzarella, bubu arare",ingredients:["shrimp","mozzarella","bubu arare","lychee gel"],allergens:["Shellfish","Milk","Gluten"],price:"₹1450",kcal:492,sig:true,pronounce:"lie-chee bon-sai"},
  {name:"Dragon mountain",cat:"Dimsum",sub:"Baked & Fried",desc:"Chicken, cha xiu sauce",ingredients:["chicken","char siu sauce","sesame","spring onion"],allergens:["Gluten","Soy","Sesame"],price:"₹1350",kcal:544,pronounce:"drag-on mown-ten"},
  {name:"Wu gok",cat:"Dimsum",sub:"Baked & Fried",desc:"5 spiced chicken puff, shiitake, purple cabbage dust",ingredients:["chicken","5 spice","shiitake","purple cabbage","taro pastry"],allergens:["Gluten","Soy"],price:"₹1350",kcal:621,pronounce:"woo gok"},
  {name:"Prosperity salad",cat:"Small Plates",sub:"Salads",desc:"Hass avocado, jujube, goji berry, toasted sesame dressing",ingredients:["hass avocado","jujube","goji berry","toasted sesame dressing"],allergens:["Sesame","Sulphite"],price:"₹1250",kcal:520,veg:true,sig:true,pronounce:"pros-per-it-ee sal-ad"},
  {name:"Sichuan chicken salad",cat:"Small Plates",sub:"Salads",desc:"Wood ear fungus, chilli threads, toasted peanuts",ingredients:["chicken","wood ear fungus","chilli threads","toasted peanuts"],allergens:["Nuts","Gluten","Soy"],price:"₹1750",kcal:427,spicy:true,pronounce:"sich-wan chick-en sal-ad"},
  {name:"Soft shell crab nest",cat:"Small Plates",sub:"Appetizers",desc:"Spiced egg floss, quail egg, black pepper sauce",ingredients:["soft shell crab","egg floss","quail egg","black pepper sauce"],allergens:["Shellfish","Egg","Gluten"],price:"₹2250",kcal:711,sig:true,pronounce:"soft shell crab nest"},
  {name:"Trio of tiger prawns",cat:"Small Plates",sub:"Appetizers",desc:"Hot Sichuan, aromatic garlic pepper and creamy pumpkin sauce",ingredients:["tiger prawns","Sichuan chilli oil","garlic","creamy pumpkin sauce"],allergens:["Shellfish","Milk","Gluten"],price:"₹2250",kcal:527,sig:true,pronounce:"tree-oh of tie-ger prawns"},
  {name:"Sichuan La Zi Ji chicken",cat:"Small Plates",sub:"Appetizers",desc:"Fragrant spice, Sichuan peppercorn, crisp fried chilli",ingredients:["chicken","dried chillies","Sichuan peppercorn","garlic"],allergens:["Gluten","Soy"],price:"₹1750",kcal:769,spicy:true,sig:true,pronounce:"sich-wan la-zuh-jee chick-en"},
  {name:"Pong Pong prawns",cat:"Small Plates",sub:"Appetizers",desc:"Puffed up like a hot air balloon, plum garlic sauce",ingredients:["king prawns","plum sauce","garlic","light batter"],allergens:["Shellfish","Gluten","Egg"],price:"₹2250",kcal:442,pronounce:"pong pong prawns"},
  {name:"Hunanese Mandarin lamb",cat:"Small Plates",sub:"Appetizers",desc:"Star anise and Chinese citrus sauce, orange peel dust",ingredients:["lamb","star anise","Chinese citrus sauce","dried orange peel"],allergens:["Gluten","Soy","Sulphite"],price:"₹2000",kcal:574,pronounce:"hew-nan-eese man-da-rin lam"},
  {name:"Imperial Jade — Vegetables",cat:"Soup",sub:"Imperial Jade",desc:"Baby spinach, sweet corn",ingredients:["baby spinach","sweet corn","vegetable broth"],allergens:["Egg","Soy"],price:"₹950",kcal:128,veg:true,pronounce:"im-peer-ee-al jade"},
  {name:"Yin Yang — Vegetables",cat:"Soup",sub:"Yin Yang",desc:"Fresh shiitake, silken tofu, chinkiang vinegar",ingredients:["fresh shiitake","silken tofu","chinkiang vinegar"],allergens:["Soy","Sulphite"],price:"₹950",kcal:160,veg:true,pronounce:"yin yang"},
  {name:"Shangxi Fragrant — Chicken",cat:"Soup",sub:"Shangxi",desc:"Star anise broth, shredded chicken",ingredients:["star anise","shredded chicken","ginger","chicken broth"],allergens:["Gluten","Soy"],price:"₹1050",kcal:210,pronounce:"shang-shee fray-grant"},
  {name:"Roast Peking Duck (Half)",cat:"Roast & BBQ",sub:"Duck",desc:"Mandarin pancakes, scallions, cucumber, plum sauce + broth + stir fried duck",ingredients:["whole duck","hoisin plum sauce","mandarin pancakes","scallion","cucumber"],allergens:["Gluten","Soy","Sulphite"],price:"₹4500",kcal:812,sig:true,pronounce:"roast pee-king duck"},
  {name:"Char siu pork",cat:"Roast & BBQ",sub:"Meat",desc:"Classic Cantonese BBQ pork neck, pickled rainbow vegetables",ingredients:["pork neck","char siu marinade","honey","five spice"],allergens:["Gluten","Soy","Pork"],price:"₹2500",kcal:527,pronounce:"char shew pork"},
  {name:"Sizzling barbeque lamb chops",cat:"Roast & BBQ",sub:"Meat",desc:"Sweet pepper sauce, pickled chillies",ingredients:["lamb chops","sweet pepper sauce","pickled chillies","cumin"],allergens:["Gluten","Sulphite"],price:"₹3750",kcal:617,sig:true,pronounce:"siz-ling bar-bee-kyoo lam chops"},
  {name:"Xiang La Tofu",cat:"Main Course",sub:"Vegetarian",desc:"Chef's take on a Sichuanese classic",ingredients:["firm tofu","Sichuan chilli bean paste","garlic","Sichuan peppercorn"],allergens:["Soy","Gluten"],price:"₹1900",kcal:516,veg:true,spicy:true,sig:true,pronounce:"shiang-la toe-foo"},
  {name:"Wok tossed Chinese eggplant",cat:"Main Course",sub:"Vegetarian",desc:"Oyster chilli sauce, Sichuan peppercorn",ingredients:["Chinese eggplant","oyster chilli sauce","Sichuan peppercorn"],allergens:["Gluten","Soy"],price:"₹1900",kcal:353,veg:true,spicy:true,pronounce:"wok tost chi-neese egg-plant"},
  {name:"Broccoli, chestnuts and goji berries",cat:"Main Course",sub:"Vegetarian",desc:"White garlic sauce",ingredients:["broccoli","water chestnuts","goji berries","white garlic sauce"],allergens:["Gluten","Soy"],price:"₹1900",kcal:347,veg:true,pronounce:"brok-oh-lee chest-nuts and go-jee ber-eez"},
  {name:"Drunken lobster",cat:"Main Course",sub:"Fish & Seafood",desc:"Narcissus rice wine, golden garlic broccoli",ingredients:["whole lobster","Narcissus rice wine","golden garlic","broccoli"],allergens:["Shellfish","Alcohol","Gluten"],price:"₹4500",kcal:493,sig:true,pronounce:"drunk-en lob-ster"},
  {name:"Cantonese steamed Chilean seabass",cat:"Main Course",sub:"Fish & Seafood",desc:"Superior soy sauce, coriander, banana chilli, young ginger",ingredients:["Chilean seabass","superior soy sauce","coriander","banana chilli"],allergens:["Fish","Soy","Gluten"],price:"₹4250",kcal:382,sig:true,pronounce:"can-ton-eese steamed chil-ee-an sea-bass"},
  {name:"Shandong style roast chicken",cat:"Main Course",sub:"Meat & Poultry",desc:"Crisp skin, black vinegar, maltose, fresh red chillies",ingredients:["whole chicken","black vinegar","maltose","five spice"],allergens:["Gluten","Soy"],price:"₹2250",kcal:581,sig:true,pronounce:"shan-dong style roast chick-en"},
  {name:"Ding baozhen chicken",cat:"Main Course",sub:"Meat & Poultry",desc:"Cashews, dried chillies, Sichuan peppercorns",ingredients:["chicken","cashew nuts","dried chillies","Sichuan peppercorns"],allergens:["Nuts","Gluten","Soy"],price:"₹2250",kcal:525,spicy:true,pronounce:"ding bao-jen chick-en"},
  {name:"Lamb shanks hot pot",cat:"Main Course",sub:"Meat & Poultry",desc:"Slow braised with shimeji mushrooms, golden mantou buns",ingredients:["lamb shank","shimeji mushrooms","spiced broth","mantou buns"],allergens:["Gluten","Soy"],price:"₹3250",kcal:578,sig:true,pronounce:"lam shanks hot pot"},
  {name:"Twice cooked pork belly",cat:"Main Course",sub:"Meat & Poultry",desc:"Black bean sauce",ingredients:["pork belly","black bean paste","garlic","leek"],allergens:["Gluten","Soy","Pork"],price:"₹3050",kcal:540,pronounce:"twice cookt pork bel-ee"},
  {name:"Yang Zhou fried rice",cat:"Accompaniments",sub:"Rice",desc:"Char siu pork, poached prawn",ingredients:["jasmine rice","char siu pork","poached prawn","egg"],allergens:["Gluten","Soy","Egg","Shellfish"],price:"₹2050",kcal:662,sig:true,pronounce:"yang-joe fried rice"},
  {name:"Lanzhou udon noodles",cat:"Accompaniments",sub:"Noodles",desc:"Flat wheat noodles from the noodle capital of China",ingredients:["Lanzhou flat wheat noodles","Asian greens","soy broth"],allergens:["Gluten","Sesame","Soy"],price:"₹1600",kcal:695,veg:true,pronounce:"lan-joe oo-don noo-dles"},
  {name:"Wat tan hor fun",cat:"Accompaniments",sub:"Noodles",desc:"Silken rice noodles in golden garlic sauce",ingredients:["silken rice noodles","golden garlic sauce","egg"],allergens:["Egg","Soy","Gluten"],price:"₹1600",kcal:512,veg:true,pronounce:"wat-tan hor-fun"},
  {name:"Darsan",cat:"Desserts",sub:"Desserts",desc:"Honey noodles with Sichuan pepper ice cream",ingredients:["honey fried noodles","Sichuan peppercorn ice cream","sesame"],allergens:["Gluten","Milk","Egg","Sesame"],price:"₹1200",kcal:472,sig:true,pronounce:"dar-san"},
  {name:"Empress' flare",cat:"Desserts",sub:"Desserts",desc:"Alphonso carnation milk, sago pearls, pomelo segments",ingredients:["Alphonso mango","carnation milk","sago pearls","pomelo"],allergens:["Milk"],price:"₹1200",kcal:352,sig:true,pronounce:"em-press flair"},
  {name:"The good luck red candy",cat:"Desserts",sub:"Desserts",desc:"Milk chocolate mousse, yuzu center, peanut rice crunch",ingredients:["milk chocolate mousse","yuzu gel","peanut rice crunch"],allergens:["Milk","Nuts","Gluten","Egg"],price:"₹1200",kcal:606,sig:true,pronounce:"the good luck red can-dee"},
  {name:"Chinese red date pudding",cat:"Desserts",sub:"Desserts",desc:"Caramelized ginger ice cream, roasted walnuts, toffee sauce",ingredients:["red date","ginger ice cream","roasted walnuts","toffee sauce"],allergens:["Milk","Egg","Nuts","Gluten"],price:"₹1200",kcal:496,pronounce:"chi-neese red date pud-ing"},
  // COCKTAILS
  {name:"Zenith",cat:"Cocktails",sub:"Signature",desc:"Vodka, cucumber, ginger, sesame",ingredients:["vodka","cucumber","ginger","sesame","lime"],allergens:["Sesame","Alcohol"],price:"₹1650",sig:true,pronounce:"zee-nith"},
  {name:"Jade Hue",cat:"Cocktails",sub:"Signature",desc:"Vodka, green juice, honey",ingredients:["vodka","fresh green juice","honey","lime"],allergens:["Alcohol"],price:"₹1650",pronounce:"jade hyoo"},
  {name:"Mandarin spice Old Fashioned",cat:"Cocktails",sub:"Signature",desc:"Bourbon, mandarin orange, five spice infusion",ingredients:["bourbon","mandarin orange","five spice infusion","orange bitters"],allergens:["Alcohol"],price:"₹1650",sig:true,pronounce:"man-da-rin spice old fash-ond"},
  {name:"Claritea",cat:"Cocktails",sub:"Signature",desc:"Bourbon, clarified jasmine tea, five spice, jaggery",ingredients:["bourbon","clarified jasmine tea","five spice","jaggery"],allergens:["Alcohol"],price:"₹1650",pronounce:"kla-ri-tea"},
  {name:"Pearl of Fire",cat:"Cocktails",sub:"Signature",desc:"Tequila, pineapple, jalapeño, Sichuan peppercorn",ingredients:["tequila","pineapple juice","jalapeño","Sichuan peppercorn"],allergens:["Alcohol"],price:"₹1650",spicy:true,pronounce:"perl of fire"},
  {name:"Madam's Favourite",cat:"Cocktails",sub:"Signature",desc:"Gin, rose tea, cardamom, coconut, cherry",ingredients:["gin","rose tea","cardamom","coconut","cherry"],allergens:["Alcohol"],price:"₹1650",sig:true,pronounce:"mad-ams fav-rit"},
  {name:"Emerald Bloom",cat:"Cocktails",sub:"Signature",desc:"Gin, lychee, basil, cucumber, five spice honey",ingredients:["gin","lychee","basil","cucumber","five spice honey"],allergens:["Alcohol"],price:"₹1650",pronounce:"em-rald bloom"},
  {name:"Mandarin Garden",cat:"Cocktails",sub:"Non-Alcoholic",desc:"Mint, spiced citrus and ginger",ingredients:["mandarin juice","mint","spiced citrus","ginger"],allergens:["Sulphite"],price:"₹650",veg:true,pronounce:"man-da-rin gar-den"},
  // WINE
  {name:"Patrick Clerget Pouilly Fumé",cat:"Wine by Glass",sub:"White",desc:"Loire France — Citrus, green apple, gooseberry. Dry, high acidity",ingredients:["100% Sauvignon Blanc","Loire Valley France"],allergens:["Sulphite","Alcohol"],price:"₹2000",region:"Loire Valley, France",grape:"Sauvignon Blanc",vintage:"2016",style:"Dry · High Acidity",pronounce:"pa-treek klair-zhay poo-ee foo-may"},
  {name:"Camas Sauvignon Blanc",cat:"Wine by Glass",sub:"White",desc:"Pays d'Oc France — Passion fruit, pineapple, citrus",ingredients:["100% Sauvignon Blanc","Pays d'Oc France"],allergens:["Sulphite","Alcohol"],price:"₹1000",region:"Pays d'Oc, France",grape:"Sauvignon Blanc",vintage:"2024",style:"Dry · Medium Acidity",pronounce:"ka-ma so-vee-nyon blon"},
  {name:"Sula Zinfandel Rosé",cat:"Wine by Glass",sub:"Rosé",desc:"Nashik India — Strawberry, raspberry, watermelon. Off-dry",ingredients:["100% Zinfandel","Nashik India"],allergens:["Sulphite","Alcohol"],price:"₹1200",region:"Nashik, India",grape:"Zinfandel",vintage:"2024",style:"Off-Dry · Medium Acidity",pronounce:"sue-la zin-fan-del ro-zay"},
  {name:"Viña Tarapacá Cabernet Sauvignon",cat:"Wine by Glass",sub:"Red",desc:"Maipo Chile — Blackcurrant, black cherry, plum. Full-bodied",ingredients:["100% Cabernet Sauvignon","Maipo Valley Chile"],allergens:["Sulphite","Alcohol"],price:"₹2000",region:"Maipo Valley, Chile",grape:"Cabernet Sauvignon",vintage:"2024",style:"Dry · Full Body",pronounce:"veen-ya ta-ra-pa-ka cab-er-nay so-vee-nyon"},
  {name:"Brancott Estate Pinot Noir",cat:"Wine by Glass",sub:"Red",desc:"Marlborough NZ — Red cherry, raspberry, cranberry, spice",ingredients:["100% Pinot Noir","Marlborough New Zealand"],allergens:["Sulphite","Alcohol"],price:"₹1900",region:"Marlborough, New Zealand",grape:"Pinot Noir",vintage:"2021",style:"Dry · Medium Body",pronounce:"bran-cot es-tate pee-no nwar"},
  {name:"Campo Viejo Tempranillo",cat:"Wine by Glass",sub:"Red",desc:"Rioja Spain — Red cherry, strawberry, plum, vanilla",ingredients:["100% Tempranillo","Rioja Spain"],allergens:["Sulphite","Alcohol"],price:"₹1500",region:"Rioja, Spain",grape:"Tempranillo",vintage:"2021",style:"Dry · Medium Body",pronounce:"cam-po vee-ay-ho tem-pra-nee-yo"},
  // CHAMPAGNE
  {name:"Moët & Chandon Brut",cat:"Champagne & Sparkling",sub:"Épernay",desc:"NV — Crisp, biscuity, elegant",ingredients:["Pinot Noir","Chardonnay","Pinot Meunier"],allergens:["Sulphite","Alcohol"],price:"₹23,500",region:"Épernay, Champagne, France",grape:"Pinot Noir, Chardonnay, Pinot Meunier",vintage:"NV",style:"Brut · High Acidity",pronounce:"moh-ett ay shan-don brew"},
  {name:"Dom Pérignon Brut",cat:"Champagne & Sparkling",sub:"Reims",desc:"2013 Prestige cuvée — the ultimate",ingredients:["Pinot Noir","Chardonnay"],allergens:["Sulphite","Alcohol"],price:"₹54,500",sig:true,region:"Reims, Champagne, France",grape:"Pinot Noir, Chardonnay",vintage:"2013",style:"Brut Vintage · Prestigious",pronounce:"dom peh-reen-yon brew"},
  {name:"Veuve Clicquot Brut",cat:"Champagne & Sparkling",sub:"Reims",desc:"NV — Yellow label icon",ingredients:["Pinot Noir dominant blend"],allergens:["Sulphite","Alcohol"],price:"₹20,000",region:"Reims, Champagne, France",grape:"Pinot Noir dominant",vintage:"NV",style:"Brut · Rich · Full-bodied",pronounce:"vuv klee-koh brew"},
  {name:"Chandon Brut Cuvée",cat:"Champagne & Sparkling",sub:"India",desc:"NV — Nashik India sparkling wine",ingredients:["Indian varieties","Nashik India"],allergens:["Sulphite","Alcohol"],price:"₹9,000",region:"Nashik, India",vintage:"NV",style:"Brut · Crisp",pronounce:"shan-don brew coo-vay"},
// SCOTCH
  {name:"The Macallan 18 YO",cat:"Scotch Whisky",sub:"Highland Single Malt",desc:"18 years — rich dried fruit, vanilla, spice",ingredients:["Single malt scotch","Highland Scotland","18 years"],allergens:["Alcohol","Gluten"],price:"₹8,500",region:"Speyside, Scotland",pronounce:"the mac-al-an eighteen year old"},
  {name:"Glenmorangie Signet",cat:"Scotch Whisky",sub:"Highland Single Malt",desc:"Chocolate malt — coffee, chocolate, orange",ingredients:["Single malt scotch","Highland Scotland","Chocolate malt"],allergens:["Alcohol","Gluten"],price:"₹4,000",region:"Highland, Scotland",pronounce:"glen-mor-an-jee sig-net"},
  {name:"The Glenlivet 25 YO",cat:"Scotch Whisky",sub:"Speyside Single Malt",desc:"Ultra-premium — honeyed, smooth",ingredients:["Single malt scotch","Speyside Scotland","25 years"],allergens:["Alcohol","Gluten"],price:"₹9,000",region:"Speyside, Scotland",pronounce:"the glen-liv-et twenty-five year old"},
  {name:"Glenfiddich 21 YO",cat:"Scotch Whisky",sub:"Speyside Single Malt",desc:"Caribbean rum cask finish",ingredients:["Single malt scotch","Speyside Scotland","Rum cask finish"],allergens:["Alcohol","Gluten"],price:"₹4,450",region:"Speyside, Scotland",pronounce:"glen-fid-ick twenty-one year old"},
  {name:"Lagavulin 16 YO",cat:"Scotch Whisky",sub:"Islay Single Malt",desc:"Peaty, smoky, medicinal",ingredients:["Single malt scotch","Islay Scotland","16 years","Heavy peat"],allergens:["Alcohol","Gluten"],price:"₹4,250",region:"Islay, Scotland",pronounce:"lag-a-voo-lin sixteen year old"},
  {name:"Johnnie Walker Blue Label",cat:"Scotch Whisky",sub:"Blended",desc:"Ultra-premium blend",ingredients:["Blended scotch","Rare aged malt and grain"],allergens:["Alcohol","Gluten"],price:"₹3,250",region:"Scotland",pronounce:"johnny walker blue label"},
  // COGNAC
  {name:"Rémy Martin Louis XIII",cat:"Cognac & Others",sub:"Cognac",desc:"The pinnacle — 100-year-old blend in crystal decanter",ingredients:["Grande Champagne Cognac","100-year blend"],allergens:["Alcohol","Sulphite"],price:"₹32,500",sig:true,region:"Grande Champagne, Cognac, France",pronounce:"ray-mee mar-tan loo-ee treh-ze"},
  {name:"Hennessy XO",cat:"Cognac & Others",sub:"Cognac",desc:"XO — rich, woody, dried fruit",ingredients:["Cognac France","100+ eaux-de-vie blend"],allergens:["Alcohol","Sulphite"],price:"₹3,950",region:"Cognac, France",pronounce:"hen-uh-see ex-oh"},
  {name:"The Yamazaki 12 YO",cat:"Cognac & Others",sub:"Japanese Whisky",desc:"Japan's iconic single malt — peach, coconut, mizunara oak",ingredients:["Japanese single malt","Yamazaki distillery","12 years"],allergens:["Alcohol","Gluten"],price:"₹3,750",region:"Osaka, Japan",pronounce:"ya-ma-za-ki twelve year old"},
  {name:"Hibiki",cat:"Cognac & Others",sub:"Japanese Whisky",desc:"Suntory's elegant blend — floral, honeyed, soft",ingredients:["Blended Japanese whisky","Suntory"],allergens:["Alcohol","Gluten"],price:"₹2,750",region:"Japan",pronounce:"hee-bee-kee"},
  {name:"Teeling Single Malt",cat:"Cognac & Others",sub:"Irish Whiskey",desc:"Award-winning Irish single malt — wine cask finish",ingredients:["Irish single malt","Dublin","Wine cask finish"],allergens:["Alcohol","Gluten"],price:"₹1,650",region:"Dublin, Ireland",pronounce:"tee-ling single malt"},
  {name:"Jägermeister",cat:"Cognac & Others",sub:"Digestif",desc:"56 herbs, fruits and spices",ingredients:["56 herbs and spices","Germany"],allergens:["Alcohol","Sulphite"],price:"₹1,450",region:"Germany",pronounce:"yay-ger-my-ster"},
  {name:"Campari",cat:"Cognac & Others",sub:"Aperitif",desc:"Bitter Italian aperitivo — 60ml",ingredients:["Bitter orange peel","herbs and spices","Italy"],allergens:["Alcohol","Sulphite"],price:"₹1,000",region:"Milan, Italy",pronounce:"cam-pa-ree"},
  // BEER
  {name:"Kingfisher Premium",cat:"Beer & Spirits",sub:"Beer",desc:"India's favourite lager — crisp and refreshing",ingredients:["barley malt","hops","yeast"],allergens:["Alcohol","Gluten"],price:"₹700",pronounce:"king-fish-er pree-mee-um"},
  {name:"Hoegaarden",cat:"Beer & Spirits",sub:"Beer",desc:"Belgian white ale — coriander and orange peel",ingredients:["wheat","barley","coriander","orange peel"],allergens:["Alcohol","Gluten"],price:"₹900",region:"Belgium",pronounce:"who-gar-den"},
  {name:"Erdinger",cat:"Beer & Spirits",sub:"Beer",desc:"German wheat beer — Bavarian tradition",ingredients:["wheat malt","barley","hops"],allergens:["Alcohol","Gluten"],price:"₹950",region:"Bavaria, Germany",pronounce:"air-ding-er"},
  // GIN & SPIRITS
  {name:"Hendricks Flora Adora",cat:"Beer & Spirits",sub:"Gin",desc:"Floral Hendricks — hibiscus and honeysuckle",ingredients:["Scottish grain spirit","cucumber","rose","flora botanicals"],allergens:["Alcohol"],price:"₹1,450",region:"Scotland",pronounce:"hen-dricks flo-ra a-dora"},
  {name:"Bombay Sapphire",cat:"Beer & Spirits",sub:"Gin",desc:"Classic London Dry — 10 botanicals",ingredients:["10 botanicals","juniper","coriander"],allergens:["Alcohol","Gluten"],price:"₹1,300",region:"England",pronounce:"bom-bay sap-fire"},
  {name:"Beluga Gold",cat:"Beer & Spirits",sub:"Vodka",desc:"Ultra-premium Russian vodka",ingredients:["Russian grain spirit","Siberian artesian water"],allergens:["Alcohol","Gluten"],price:"₹2,950",region:"Siberia, Russia",pronounce:"bell-oo-ga gold"},
  {name:"Don Julio 1942",cat:"Beer & Spirits",sub:"Tequila",desc:"Iconic aged añejo — caramel, vanilla, agave",ingredients:["100% Blue Agave","Jalisco Mexico","2.5 years aged"],allergens:["Alcohol"],price:"₹5,200",region:"Jalisco, Mexico",pronounce:"don hoo-lee-oh nineteen forty-two"},
  {name:"Patrón El Alto",cat:"Beer & Spirits",sub:"Tequila",desc:"Ultra-premium Patrón expression",ingredients:["100% Blue Weber Agave","Highlands Mexico"],allergens:["Alcohol"],price:"₹5,200",region:"Jalisco Highlands, Mexico",pronounce:"pa-tron el al-to"},
  {name:"Bacardi Ocho 8 YO",cat:"Beer & Spirits",sub:"Rum",desc:"Aged Cuban rum — complex and smooth",ingredients:["molasses","Cuba","8 years aged"],allergens:["Alcohol"],price:"₹1,150",region:"Caribbean",pronounce:"ba-car-dee o-cho eight year old"},
  // SOFT DRINKS
  {name:"BLÅ | JASMINE Sparkling Tea",cat:"Soft Drinks",sub:"Copenhagen Tea",desc:"Jasmine, chamomile, citrus — smooth white and green tea",ingredients:["jasmine tea","chamomile","citrus","silver needle white tea"],allergens:["Sulphite"],price:"₹950 / ₹4500",veg:true,pronounce:"blaw jas-min spark-ling tea"},
  {name:"LYSEGRØN | SENCHA",cat:"Soft Drinks",sub:"Copenhagen Tea",desc:"Fresh citrusy green tea — lemongrass, apple, Darjeeling",ingredients:["Sencha green tea","lemongrass","apple","Darjeeling tea"],allergens:["Sulphite"],price:"₹950 / ₹4500",veg:true,pronounce:"lee-seh-grun sen-cha"},
  {name:"LYSERØD | HIBISCUS",cat:"Soft Drinks",sub:"Copenhagen Tea",desc:"Dry sparkling rose tea — red berry, apple, hibiscus",ingredients:["hibiscus","red berry","apple","silver needle white tea"],allergens:["Sulphite"],price:"₹950 / ₹4500",veg:true,pronounce:"lee-seh-rudh hi-bis-kus"},
  {name:"Kombucha — Stabilize",cat:"Soft Drinks",sub:"Kombucha",desc:"Beetroot, moringa, Indian hibiscus",ingredients:["kombucha base","beetroot","moringa","Indian hibiscus"],allergens:["Sulphite"],price:"₹600",veg:true,pronounce:"kom-boo-cha"},
  {name:"Red Bull",cat:"Soft Drinks",sub:"Others",desc:"Energy drink 330ml",ingredients:["taurine","caffeine","B vitamins","sugar"],allergens:[],price:"₹375",veg:true,pronounce:"red bull"},
  {name:"Perrier",cat:"Soft Drinks",sub:"Others",desc:"Sparkling mineral water 330ml",ingredients:["natural mineral water","natural CO2"],allergens:[],price:"₹475",veg:true,pronounce:"peh-ree-ay"},
];

const alcoholicCats=['Cocktails','Wine by Glass','Champagne & Sparkling','Scotch Whisky','Cognac & Others','Beer & Spirits'];
const allCats=[...new Set(ALL.map(i=>i.cat))];
let userName='', quizType='classic', quizSelectedCat=null;
let quizQs=[], quizIdx=0, quizScore=0, quizAnswered=false;
let fcItems=[], fcIndex=0, fcFlipped=false;
let currentPronounceText='';

// ===================== UTILS =====================
function shuffle(a){return[...a].sort(()=>Math.random()-0.5);}
function pick(arr,n){return shuffle(arr).slice(0,n);}
function catEmoji(cat){
  const m={'Dimsum':'🥟','Small Plates':'🥗','Soup':'🍜','Roast & BBQ':'🔥','Main Course':'🍽️','Accompaniments':'🍚','Desserts':'🍮','Cocktails':'🍹','Wine by Glass':'🍷','Champagne & Sparkling':'🥂','Scotch Whisky':'🥃','Cognac & Others':'🥃','Beer & Spirits':'🍺','Soft Drinks':'🫧'};
  return m[cat]||'•';
}
function saveName(){
  const v=document.getElementById('user-name-input').value.trim();
  if(!v){document.getElementById('user-name-input').style.borderColor='var(--crimson)';return;}
  userName=v;
  document.getElementById('name-popup').style.display='none';
  renderBrowse();renderFCCats();renderQuizSetup();generateIGCards();
}
document.getElementById('user-name-input').addEventListener('keydown',e=>{if(e.key==='Enter')saveName();});
function switchTab(tab){
  const tabs=['browse','flashcard','quiz','impossible'];
  document.querySelectorAll('.tab').forEach((t,i)=>t.classList.toggle('active',tabs[i]===tab));
  tabs.forEach(t=>document.getElementById('tab-'+t).classList.toggle('hidden',t!==tab));
}

// ===================== BROWSE =====================
function renderBrowse(){
  const el=document.getElementById('browse-all');
  const grouped={};
  ALL.forEach(item=>{
    if(!grouped[item.cat])grouped[item.cat]={};
    if(!grouped[item.cat][item.sub])grouped[item.cat][item.sub]=[];
    grouped[item.cat][item.sub].push(item);
  });
  let html='',gstShown=false;
  for(const cat in grouped){
    if(alcoholicCats.includes(cat)&&!gstShown){
      gstShown=true;
      html+=`<div class="gst-notice">⚠️ <div><strong>GST Notice (Gurugram):</strong> Alcoholic beverages attract 18.9% GST. Food items attract 5% GST. All prices shown are exclusive of tax.</div></div>`;
    }
    html+=`<div class="section-title">${catEmoji(cat)} ${cat}</div>`;
    for(const sub in grouped[cat]){
      if(Object.keys(grouped[cat]).length>1)html+=`<div class="subsection-title">${sub}</div>`;
      grouped[cat][sub].forEach(item=>{html+=itemCardHTML(item);});
    }
  }
  el.innerHTML=html;
}
function itemCardHTML(item){
  let badges='';
  if(item.veg)badges+=`<span class="badge badge-veg">🌿 Veg</span>`;
  if(item.sig)badges+=`<span class="badge badge-sig">⭐ Signature</span>`;
  if(item.spicy)badges+=`<span class="badge badge-spicy">🌶️ Spicy</span>`;
  const idx=ALL.indexOf(item);
  return `<div class="item-card" onclick="showDetail(${idx})">
    <div style="flex:1">
      <div class="item-name">${item.name}${badges?' '+badges:''}</div>
      <div class="item-desc">${item.desc||''}${item.kcal?`<span class="kcal">${item.kcal} kcal</span>`:''}</div>
      <div class="tap-hint">Tap for ingredients, allergens & pronunciation →</div>
    </div>
    <div class="item-price">${item.price}</div>
  </div>`;
}
function doSearch(){
  const q=document.getElementById('search-input').value.toLowerCase().trim();
  const res=document.getElementById('browse-results');
  const all=document.getElementById('browse-all');
  if(!q){res.innerHTML='';all.style.display='';return;}
  all.style.display='none';
  const matches=ALL.filter(i=>i.name.toLowerCase().includes(q)||(i.desc||'').toLowerCase().includes(q)||i.cat.toLowerCase().includes(q)||(i.ingredients||[]).join(' ').toLowerCase().includes(q));
  res.innerHTML=matches.length?`<div class="subsection-title">${matches.length} result${matches.length>1?'s':''}</div>`+matches.map(itemCardHTML).join(''):`<div style="text-align:center;color:var(--muted);padding:36px">No results for "<strong>${q}</strong>"</div>`;
}

// ===================== DETAIL POPUP =====================
function showDetail(idx){
  const item=ALL[idx];
  const isAlco=alcoholicCats.includes(item.cat);
  const allergens=(item.allergens||[]).length?item.allergens.map(a=>`<span class="allergen-chip">${a}</span>`).join(''):`<span style="color:var(--muted);font-size:0.82rem">None identified</span>`;
  const ingredients=(item.ingredients||[]).length?item.ingredients.map(i=>`• ${i}`).join('<br>'):item.desc;
  let wineSection='';
  if(item.region&&(item.cat==='Wine by Glass'||item.cat==='Champagne & Sparkling')){
    wineSection=`<div class="detail-section">
      <div class="detail-section-title">🗺️ Wine Region & Details</div>
      <div style="background:var(--cream);border-radius:8px;padding:12px;font-size:0.84rem;line-height:1.9">
        <div>📍 <strong>Region:</strong> ${item.region}</div>
        ${item.grape?`<div>🍇 <strong>Grape:</strong> ${item.grape}</div>`:''}
        ${item.vintage?`<div>📅 <strong>Vintage:</strong> ${item.vintage}</div>`:''}
        ${item.style?`<div>🎯 <strong>Style:</strong> ${item.style}</div>`:''}
      </div>
    </div>`;
  } else if(item.region){
    wineSection=`<div class="detail-section"><div class="detail-section-title">📍 Origin</div><div style="font-size:0.87rem;color:var(--ink)">${item.region}</div></div>`;
  }
  const gstNote=isAlco?`<div style="background:#FFF8E8;border-radius:6px;padding:8px 10px;font-size:0.74rem;color:#7A5A00;margin-top:8px">⚠️ 18.9% GST applicable (Gurugram rate)</div>`:`<div style="font-size:0.72rem;color:var(--muted);margin-top:8px">5% GST applicable</div>`;
  document.getElementById('detail-content').innerHTML=`
    <div class="detail-name">${item.name}</div>
    <div class="detail-cat">${catEmoji(item.cat)} ${item.cat} · ${item.sub}</div>
    ${item.pronounce?`<button class="pronounce-btn" onclick="openPronounce('${item.name.replace(/'/g,"\\'")}','${item.pronounce.replace(/'/g,"\\'")}')">🔊 How to say this</button>`:''}
    <div class="detail-price-big">${item.price}${item.kcal?` <span style="font-size:0.95rem;color:var(--muted);font-weight:400">${item.kcal} kcal</span>`:''}</div>
    <div class="detail-section">
      <div class="detail-section-title">🌿 Ingredients</div>
      <div style="font-size:0.87rem;color:var(--ink);line-height:1.7">${ingredients}</div>
    </div>
    ${wineSection}
    <div class="detail-section">
      <div class="detail-section-title">⚠️ Allergens</div>
      <div style="display:flex;flex-wrap:wrap;gap:4px">${allergens}</div>
    </div>
    ${item.veg||item.sig||item.spicy?`<div class="detail-section">
      <div class="detail-section-title">ℹ️ Notes</div>
      <div style="font-size:0.84rem">${[item.veg?'🌿 Vegetarian/Vegan friendly':'',item.sig?'⭐ Signature dish':'',item.spicy?'🌶️ Contains spice':''].filter(Boolean).join(' · ')}</div>
    </div>`:''}
    ${gstNote}`;
  document.getElementById('detail-popup').classList.remove('hidden');
}
function closeDetailOverlay(e){if(e.target===document.getElementById('detail-popup'))document.getElementById('detail-popup').classList.add('hidden');}
function closeDetailBtn(){document.getElementById('detail-popup').classList.add('hidden');}

// ===================== PRONUNCIATION =====================
function openPronounce(name, phonetic){
  document.getElementById('pp-name').textContent=name;
  document.getElementById('pp-phonetic').textContent=phonetic;
  currentPronounceText=phonetic;
  document.getElementById('pronounce-popup').classList.remove('hidden');
}
function closePronounce(){document.getElementById('pronounce-popup').classList.add('hidden');}
function speakNow(){
  const text=currentPronounceText;
  if(!text)return;
  // Try multiple speech approaches
  if(window.speechSynthesis){
    window.speechSynthesis.cancel();
    setTimeout(()=>{
      const u=new SpeechSynthesisUtterance(text);
      u.lang='en-US';
      u.rate=0.7;
      u.pitch=1.0;
      u.volume=1.0;
      // Find a good voice
      const voices=window.speechSynthesis.getVoices();
      const eng=voices.find(v=>v.lang.startsWith('en')&&!v.name.includes('Google')||v.lang.startsWith('en'));
      if(eng)u.voice=eng;
      window.speechSynthesis.speak(u);
    },100);
  } else {
    alert('Speech not supported on this browser. Read the phonetic guide above!');
  }
}
// Pre-load voices on page load
if(window.speechSynthesis){
  window.speechSynthesis.onvoiceschanged=()=>window.speechSynthesis.getVoices();
  setTimeout(()=>window.speechSynthesis.getVoices(),500);
}

    },
    () => {
      const dumplings = pool.filter(i=>i.cat==='Dimsum');
      if(dumplings.length<4) return null;
      const chosen = shuffle(dumplings)[0];
      const wrongs = shuffle(dumplings.filter(i=>i.name!==chosen.name)).slice(0,3);
      return {
        scenario:`A guest is sharing a meal for two and wants to order dimsum. They ask: "What's the most creative and interesting dimsum you have?"`,
        q:`Which dimsum would you highlight as the most creative and memorable?`,
        opts:shuffle([chosen.name,...wrongs.map(i=>i.name)]),
        correct:chosen.sig?chosen.name:wrongs.find(i=>i.sig)?.name||chosen.name,
        explain:`${chosen.sig?chosen.name:wrongs.find(i=>i.sig)?.name||chosen.name} stands out for its creative approach. ${chosen.sig?chosen.desc:''} For dimsum, always highlight signature dishes first.`
      };
    },
  ];

  for(const fn of shuffle(scenarios)){
    try{ const q=fn(); if(q&&q.opts&&q.opts.length===4) return q; } catch(e){}
  }
  return null;
}

time.`;}
  else if(pct>=40){emoji='🍵';msg=`Hey, everyone starts somewhere, ${name}! The menu has layers — keep exploring and it'll all click soon.`;}
  else{emoji='🌸';msg=`Okay ${name}, the menu clearly has some secrets left for you! Hit the flashcards and come back stronger 💪`;}
  document.getElementById('quiz-game').innerHTML=`
    <div class="score-card fade-in">
      <div style="font-size:2.8rem;margin-bottom:8px">${emoji}</div>
      <div class="score-big">${quizScore}/${quizQs.length}</div>
      <div class="score-label">${pct}% · ${typeLabel}</div>
      <div class="score-msg">${msg}</div>
      <div class="score-by">— by dizzi</div>
      <button class="start-btn" onclick="renderQuizSetup()">Play Again 🔄</button>
    </div>`;
}

// ===================== IMPOSSIBLE GUEST CARDS =====================
// AI dynamically generates guest scenarios from real menu data
function generateIGCards(){
  const el=document.getElementById('ig-list');
  el.innerHTML=`<div class="ai-loading"><div class="ai-loading-spinner"></div><p>Generating guest scenarios<span class="ai-dots"><span>.</span><span>.</span><span>.</span></span></p></div>`;
  setTimeout(()=>{
    const scenarios=buildIGScenarios();
    el.innerHTML=scenarios.map((g,i)=>`
      <div class="ig-card" onclick="toggleIG(${i})">
        <div class="ig-demand">"${g.demand}"</div>
        <div class="ig-tags">${g.tags.map(t=>`<span class="ig-tag">${t}</span>`).join('')}</div>
        <div style="font-size:0.72rem;color:var(--gold);font-weight:500">Tap to reveal the perfect solution ✨</div>
        <div class="ig-answer" id="ig-ans-${i}">
          <div class="ig-dish">✅ ${g.dish}</div>
          <div class="ig-reason">${g.reason}</div>
          <div class="ig-mod">💡 <strong>Pro tip:</strong> ${g.mod}</div>
        </div>
      </div>`).join('');
  },800);
}

function buildIGScenarios(){
  const scenarios=[];
  // 1. Dairy-free but creamy
  const dairyFree=ALL.filter(i=>!(i.allergens||[]).includes('Milk')&&i.veg);
  if(dairyFree.length){
    const d=shuffle(dairyFree)[0];
    scenarios.push({demand:"I want something creamy but I'm completely dairy-free 🥛",tags:["Dairy-free","Creamy texture"],dish:d.name,reason:`${d.name} delivers on texture without any dairy. ${d.desc} — the natural ingredients create a satisfying mouthfeel.`,mod:"Always confirm with the kitchen that no butter is used in the wok. Ask for extra sauce if they want more richness."});
  }
  // 2. Under X calories but satisfying
  const lowCal=ALL.filter(i=>i.kcal&&i.kcal<300&&i.kcal>100);
  if(lowCal.length){
    const l=shuffle(lowCal)[0];
    scenarios.push({demand:"I'm watching my calories but I don't want to feel like I'm dieting 🥗",tags:["Low calorie","Still satisfying"],dish:l.name,reason:`At only ${l.kcal} kcal, ${l.name} is light but not boring. ${l.desc} — it's a genuinely delicious choice that happens to be kind to the waistline.`,mod:"Pair with Imperial Jade vegetable soup (128 kcal) for a full meal still under 450 kcal total."});
  }
  // 3. Nut allergy but wants complex flavour
  const nutFree=ALL.filter(i=>!(i.allergens||[]).includes('Nuts')&&!(i.allergens||[]).includes('Sesame')&&i.cat==='Main Course');
  if(nutFree.length){
    const n=shuffle(nutFree)[0];
    scenarios.push({demand:"I have a severe nut allergy but I want the most flavourful dish possible 🥜❌",tags:["Nut-free","Flavourful"],dish:n.name,reason:`${n.name} is completely nut and sesame free while delivering incredible flavour. ${n.desc}`,mod:"Inform the kitchen of the nut allergy so they can use a clean wok. Cross-contamination is the real risk to check."});
  }
  // 4. Non-alcoholic but sophisticated
  const nonAlco=ALL.filter(i=>!(i.allergens||[]).includes('Alcohol')&&i.cat==='Soft Drinks');
  if(nonAlco.length){
    const na=shuffle(nonAlco)[0];
    scenarios.push({demand:"I don't drink alcohol but everyone at my table is having cocktails. I feel left out 😢",tags:["Non-alcoholic","Sophisticated"],dish:na.name,reason:`${na.name} is genuinely sophisticated — ${na.desc}. Serve it in a beautiful glass and nobody will know it's non-alcoholic.`,mod:"Suggest the Copenhagen Sparkling Teas — served in champagne flutes they look incredible on the table and feel truly celebratory."});
  }
  // 5. Shellfish allergy
  const shellFree=ALL.filter(i=>!(i.allergens||[]).includes('Shellfish')&&i.cat==='Main Course'&&!i.veg);
  if(shellFree.length){
    const s=shuffle(shellFree)[0];
    scenarios.push({demand:"I'm allergic to shellfish but I want something impressive as my main course 🦐❌",tags:["Shellfish-free","Impressive main"],dish:s.name,reason:`${s.name} is completely shellfish-free and genuinely impressive. ${s.desc} — this is a dish that will make any guest happy.`,mod:"Remind the kitchen to use shellfish-free utensils. A serious allergy needs full transparency with the chef."});
  }
  // 6. Something sweet not sugary
  const desserts=ALL.filter(i=>i.cat==='Desserts'&&i.kcal&&i.kcal<400);
  if(desserts.length){
    const d=shuffle(desserts)[0];
    scenarios.push({demand:"I want something sweet but I don't want a sugar rush 🍬",tags:["Sweet","Not too sugary"],dish:d.name,reason:`${d.name} at ${d.kcal} kcal uses natural sweetness rather than heavy refined sugar. ${d.desc}`,mod:"The Empress' flare uses Alphonso mango and pomelo — natural fruit sugars only. Ask for no extra condensed milk for a lighter finish."});
  }
  // 7. Big appetite, value for money
  const bigDishes=ALL.filter(i=>i.kcal&&i.kcal>700&&i.cat!=='Cocktails');
  if(bigDishes.length){
    const b=shuffle(bigDishes)[0];
    scenarios.push({demand:"I'm absolutely starving and I want to feel full. What's the most substantial dish? 🍖",tags:["Hearty","High calorie","Filling"],dish:b.name,reason:`${b.name} at ${b.kcal} kcal is one of the most substantial options. ${b.desc} — a truly satisfying choice.`,mod:"Pair with Yang Zhou fried rice (662 kcal) for a genuinely filling combination. That's a proper meal!"});
  }
  // 8. Signature dish for first timer
  const sigDishes=ALL.filter(i=>i.sig&&i.cat!=='Cocktails');
  if(sigDishes.length){
    const s=shuffle(sigDishes)[0];
    const s2=shuffle(sigDishes.filter(i=>i.name!==s.name))[0];
    scenarios.push({demand:"It's my first time here and I want to order what the restaurant is REALLY known for 🌟",tags:["First visit","Signature","Must-try"],dish:`${s.name} + ${s2?s2.name:'Prosperity salad'}`,reason:`${s.name} is a signature of Madam Chow — ${s.desc}. ${s2?`Pair it with ${s2.name} (${s2.desc}) for the full experience.`:''}`,mod:"Always guide first-timers to signature dishes. These represent the chef's vision and are what regulars keep coming back for."});
  }
  return shuffle(scenarios).slice(0,8);
}

function toggleIG(i){document.getElementById('ig-ans-'+i).classList.toggle('show');}

// ===================== INIT =====================
renderBrowse();
</script>
</body>
</html>
