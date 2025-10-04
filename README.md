# 🗃️ Public Ledger Donation (Base Network)

This repository documents the **PublicLedger** smart contract deployed on the Base network. This unique contract functions as a public donation ledger designed to securely store and publicly log direct ETH transfers from users. The collected funds are held in the contract balance, ready for the owner to withdraw in a separate, recorded transaction.

## 🔗 Project Details

| Parameter | Value |
| :--- | :--- |
| **Contract Name** | `PublicLedger` (Public Donation Ledger) |
| **Owner Address (Your Wallet)** | `0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7` |
| **Deployed Contract Address** | **`0xcf45453Ca7dcC84AbaA95462F52e4F5bC400E508`** |
| **Minimum Donation** | **$0.000001$ ETH** |
| **BaseScan Link** | [https://basescan.org/address/0xcf45453Ca7dcC84AbaA95462F52e4F5bC400E508](https://basescan.org/address/0xcf45453Ca7dcC84AbaA95462F52e4F5bC400E508) |

---

## 🛠️ Deployment and Verification Settings

The contract was deployed using **Remix IDE**. For successful source code verification on BaseScan, these exact compiler settings were utilized:

| Setting | Value |
| :--- | :--- |
| **Solidity Version** | `0.8.30` |
| **Optimizer Enabled** | **Yes** |
| **Optimizer Runs** | `200` |
| **Constructor Arguments** | None (Empty) |

---

## 💡 User Interaction Guide (Donation/Deposit)

The contract is designed so that users **only need to perform a standard ETH transfer** directly to the contract address. The `receive()` function handles the validation and logging.

### Steps for Donors (Users)

1.  **Open Wallet:** Open any wallet connected to the Base network (e.g., MetaMask).
2.  **Recipient:** Paste the **Contract Address** (`0xcf45...E508`) into the recipient field.
3.  **Amount:** Input an amount of Base ETH that is **$0.000001$ ETH or higher**.
    * *Note: Transfers below this amount will revert (fail) due to the contract's minimum requirement.*
4.  **Confirm:** Confirm the transaction and pay the gas fee.

### Automated Results on BaseScan

Upon successful deposit, BaseScan records the interaction:

1.  **Donation Logged:** The transaction's **Events Log** will show a **`DonationLogged` Event**, publicly recording the donor's address and the amount donated.
2.  **Public Data:** The contract's public `donorList` and `totalCollected` variables are updated.

---

## 💰 Owner Withdrawal Instruction

The collected funds remain in the contract until the owner manually calls the withdrawal function.

### Owner Steps

1.  **Access Contract:** Visit the [BaseScan Link](https://basescan.org/address/0xcf45453Ca7dcC84AbaA95462F52e4F5bC400E508).
2.  **Navigate:** Go to the **Contract** tab, then **Write Contract**.
3.  **Function Call:** Connect your owner wallet (`0x2A6b...`) and call the **`withdrawAllFunds`** function.
4.  **Result:** This action triggers an **Internal Transaction** on BaseScan, moving all collected ETH from the Contract Address to your Owner Wallet.

---

## 📄 Source Code

The Solidity source code for the `PublicLedger.sol` contract is available in the `contracts/` directory of this repository.

## 📜 License

This project is licensed under the **MIT License**.
