enum FrequencyEnum {
  everyDay,
  everyOtherDay,
  specialDayOfTheWeek,
  everyXDay,
  everyXWeek,
  everyXMonth;

  getString() {
    switch (this) {
      case FrequencyEnum.everyDay:
        return 'Every Day';
      case FrequencyEnum.everyOtherDay:
        return 'Every Other Day';
      case FrequencyEnum.specialDayOfTheWeek:
        return 'Special Day of the Week';
      case FrequencyEnum.everyXDay:
        return 'Every X Day';
      case FrequencyEnum.everyXWeek:
        return 'Every X Week';
      case FrequencyEnum.everyXMonth:
        return 'Every X Month';
    }
  }

 static List<FrequencyEnum> getFrequencyList() {
    return [
      FrequencyEnum.everyDay,
      FrequencyEnum.everyOtherDay,
      FrequencyEnum.specialDayOfTheWeek,
      FrequencyEnum.everyXDay,
      FrequencyEnum.everyXWeek,
      FrequencyEnum.everyXMonth,
    ];
  }

  static FrequencyEnum getFrequencyEnum(String frequency) {
    switch (frequency) {
      case 'Every Day':
        return FrequencyEnum.everyDay;
      case 'Every Other Day':
        return FrequencyEnum.everyOtherDay;
      case 'Special Day of the Week':
        return FrequencyEnum.specialDayOfTheWeek;
      case 'Every X Day':
        return FrequencyEnum.everyXDay;
      case 'Every X Week':
        return FrequencyEnum.everyXWeek;
      case 'Every X Month':
        return FrequencyEnum.everyXMonth;
      default:
        return FrequencyEnum.everyDay;
    }
  }
}
