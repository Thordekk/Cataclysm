#include "Config.h"
#include "World.h"

class DuelResetCooldown : public PlayerScript
{
public:
    DuelResetCooldown() : PlayerScript("DuelResetCooldown") {}

    void OnDuelStart(Player* player1, Player* player2)
    {
        player1->SetHealth(player1->GetMaxHealth());
        player2->SetHealth(player2->GetMaxHealth());

        switch (player1->GetPowerType())
        {
        case POWER_MANA:
            player1->SetPower(POWER_MANA, player1->GetMaxPower(POWER_MANA));
            break;
        case POWER_RAGE:
            player1->SetPower(POWER_RAGE, 0);
            break;
        case POWER_RUNIC_POWER:
            player1->SetPower(POWER_RUNIC_POWER, 0);
            break;
        case POWER_ECLIPSE:
            player1->SetPower(POWER_ECLIPSE, 0);
            break;
        case POWER_HOLY_POWER:
            player1->SetPower(POWER_HOLY_POWER, 0);
            break;
        }

        switch (player2->GetPowerType())
        {
        case POWER_MANA:
            player2->SetPower(POWER_MANA, player2->GetMaxPower(POWER_MANA));
            break;
        case POWER_RAGE:
            player2->SetPower(POWER_RAGE, 0);
            break;
        case POWER_RUNIC_POWER:
            player2->SetPower(POWER_RUNIC_POWER, 0);
            break;
        case POWER_ECLIPSE:
            player1->SetPower(POWER_ECLIPSE, 0);
            break;
        case POWER_HOLY_POWER:
            player1->SetPower(POWER_HOLY_POWER, 0);
            break;
        }
    }

    void OnDuelEnd(Player* winner, Player* loser, DuelCompleteType /*type*/)
    {
        // reset cooldowns in Elewynn Forest and Durotar
        if (winner->GetAreaId() == (45) || winner->GetAreaId() == (45)) // Edit area with the wanted areaid here
        {
            winner->ResetAllPowers();
            winner->RemoveArenaSpellCooldowns(true);
            winner->CombatStop(true);
            winner->RemoveAurasDueToSpell(25771);
            loser->ResetAllPowers();
            loser->RemoveArenaSpellCooldowns(true);
            loser->CombatStop(true);
            loser->RemoveAurasDueToSpell(25771);
        }
    }
};

void AddCatacustomscripts()
{
    new DuelResetCooldown;
}
