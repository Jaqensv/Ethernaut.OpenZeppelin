
# 🧠 Méthodologie d'Audit Manuel de Contrat Solidity

---

## 1. 🔍 Reconnaitre l'architecture

- Identifier le rôle du contrat (token, vault, NFT, etc.)
- Définir les acteurs (admin, user, oracle, DAO…)
- Déterminer les dépendances (OpenZeppelin, Chainlink, etc.)
- Repérer les fonctions critiques (`withdraw`, `mint`, etc.)

---

## 2. 🛡️ Cartographie des permissions

| Fonction        | Qui peut l’appeler ?  | Effet critique ? |
|----------------|------------------------|------------------|
| `withdraw()`    | `onlyOwner`            | ✅ Oui            |
| `mint()`        | `minter role`          | ✅ Oui            |
| `buy()`         | `anyone`               | ⚠️ envoie d’ETH    |

- Identifier qui a accès à quoi
- Vérifier les contrôles : `require(...)`, `onlyOwner`, `hasRole(...)`, etc.

---

## 3. 🕵️ Analyse ligne par ligne (guidée par le risque)

- Inspecter les fonctions critiques (`transfer`, `call`, `delegatecall`, `selfdestruct`)
- Vérifier les appels externes (risques de reentrancy)
- Contrôler l’ordre logique : état avant/après appels externes
- Identifier les patterns risqués (`tx.origin`, boucles gas-heavy, fallback dangereux)

---

## 4. 🔥 Scénarios d’exploitation & abus logique

- Si j’étais un attaquant, **comment je volerais de l’argent ?**
- Est-ce qu’une fonction est exploitable en boucle ?
- Et si je passe une valeur max, 0, une adresse nulle ?
- Y a-t-il un contournement d’accès, un oubli de `onlyOwner` ?

---

## 5. ✅ Checklist sécurité

| Élément                  | Vérification                            |
|--------------------------|------------------------------------------|
| Initialisation unique    | Constructor ou `initializer` protégé     |
| Contrôle d’accès         | `onlyOwner`, `require(...)`, rôles        |
| Appels externes          | Appels protégés, pas après modification d'état |
| Gestion des ETH          | `payable`, `msg.value`, transferts bien gérés |
| Events critiques         | Sont-ils bien émis (transfert, mint...) ? |

---

## 6. 📝 Rédaction de l’audit

- ✅ Points solides et bien implémentés
- ⚠️ Comportements risqués (grief, edge case)
- ❌ Vulnérabilités avérées (avec scénario reproductible)
- Inclure **explication, impact, et recommandation claire**

---

## 🧠 Spécificités `mapping` en Solidity

- ✅ Lecture : `mapping[key]`
- ✅ Écriture : `mapping[key] = value`
- ✅ Suppression : `delete mapping[key]`
- ❌ Pas de `.length`, `.keys()`, `.values()`, `.add()`
- 🛠️ Si besoin d’itération : maintenir un tableau d’index à la main

---

