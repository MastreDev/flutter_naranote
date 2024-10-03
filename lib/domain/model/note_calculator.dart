class NoteCalculator {

  // 총 이자 = (원금 / 30) * 기간 * 이율
  // 만약 만기일 까지의 기간이 30일 미만일 경우, 31일로 계산
  // ex) 20일인 경우 -> (원금 / 30) * 31 * 이율
  // 송금액 = 어음 금액 - (이자 + 수수료)
  // 수수료는 고정 금액 (4,000 or 3,500)
  calc(int principal, int range, double ratio, int charge) {
    final interest = principal / 30 * range * ratio / 100;
    return principal - interest.round() - charge;
  }

}