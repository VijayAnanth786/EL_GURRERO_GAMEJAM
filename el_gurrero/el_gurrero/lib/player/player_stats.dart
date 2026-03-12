/// Holds player stats like health, attack power, etc.
/// Branch: player
class PlayerStats {
  int maxHealth;
  int currentHealth;
  int attackPower;
  double speed;

  PlayerStats({
    this.maxHealth = 100,
    this.currentHealth = 100,
    this.attackPower = 10,
    this.speed = 200.0,
  });

  bool get isDead => currentHealth <= 0;

  void takeDamage(int amount) {
    currentHealth = (currentHealth - amount).clamp(0, maxHealth);
  }

  void heal(int amount) {
    currentHealth = (currentHealth + amount).clamp(0, maxHealth);
  }

  void reset() {
    currentHealth = maxHealth;
  }
}
