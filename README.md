# 🧾 Onchain Resume

A verifiable, onchain CV designed for builders in web3.  
Not just wallet history — this is proof of work, endorsements, and experience all logged onchain.

Whether you're deep in DAOs, contributing to protocols, or shipping solo — your work deserves to be **recorded, endorsed, and owned by you.**

---

## 🚀 Features

- `addExperience()`: Add your onchain work history (title, org, description, start/end date)
- `endorse()`: Get skill endorsements from other builders holding a trust badge NFT
- `getRecentEndorsements()`: Fetch the latest 5 endorsements you’ve received
- `Soulbound-style rep tracking` — **1 star = 1 real endorsement**

---

## 💡 Why?

Your GitHub might be buried.  
Farcaster posts get lost.  
DAO proposals are scattered.

There’s no unified place that says:

> “This person ships. This person is trusted.”

So I built one — **onchain.**

---

## 🔨 Contract Functions

### ✅ `addExperience(string role, string company, string desc, uint startDate, uint endDate)`
Log your experience — works like a resume line item.

### ✅ `endorse(address user)`
Send someone a reputation "star" — only possible if you're holding a valid TrustBadgeNFT and haven’t endorsed that user before.

### ✅ `getRecentEndorsements(address user) → Endorsement[]`
Returns the **latest 5 endorsements** for a user, ordered from oldest to newest (most recent at end of array).

---

## 🌐 Potential Use Cases

- DAO-native resumes
- Skill-based trust scores
- Verifiable builder profiles
- Identity legos for rep systems or zk-based attestations
- Onchain team formation

---

## ⚙️ Stack

- 💻 [Foundry](https://book.getfoundry.sh/) – testing & development
- 🔐 Solidity ^0.8.20
- 🔲 NFT-based endorsement via `TrustBadgeNFT`

---

## 🧪 Local Testing

```bash
forge build
forge test


🌱 Roadmap Ideas

Frontend integration (Farcaster/Frames?)

More modular resume components

Trust-weighted endorsements

ZK-compatible attestations

DAO/org-specific resume views


👨‍🚀 Author
Built with love (and curiosity) by a solo builder exploring onchain identity.
Still just a hobby, but who knows where it goes.

📄 License
MIT – free to fork, remix, build on.