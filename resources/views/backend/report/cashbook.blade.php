@extends('backend.layout.main') @section('content')
  <div class="container-fluid">

    <div class="card mt-4">
      <div class="card-body">


        <form>
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" value="{{ $start_date ?? null }}" name="start_date" id="start_date"
                  class="form-control">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" name="end_date" id="end_date" class="form-control" value="{{ $end_date ?? null }}">
              </div>
            </div>
            <div class="col-md-3">
              <button type="submit" class="btn btn-primary text-light mt-4"
                style="margin-top: 31px !important;">{{ __('Submit') }}</button>

              @if ($start_date || $end_date)
                <a href="{{ route('report.product_ledger') }}" class="btn btn-danger"
                  style="margin-top: 31px !important;">Clear Search</a>
              @endif
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header text-center">
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Cashbook') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">

        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-center" colspan="3">{{ __('Debit') }}</th>
                <th class="text-center" colspan="3">{{ __('Credit') }}</th>
              </tr>
              <tr>
                <th>{{ __('Date') }}</th>
                <th>{{ __('Particular') }}</th>
                <th>{{ __('Cash') }}</th>
                <th>{{ __('Date') }}</th>
                <th>{{ __('Particular') }}</th>
                <th>{{ __('Cash') }}</th>
              </tr>
            </thead>
            <tbody>
              @php
                $debit_count = $items['Debit']->count();
                $credit_count = $items['Credit']->count();
              @endphp
              @for ($i = 0; $i < max($items['Debit']->count(), $items['Credit']->count()); $i++)
                @php
                  if ($i < $debit_count) {
                      $debit = (object) $items['Debit'][$i];
                  }

                  if ($i < $credit_count) {
                      $credit = (object) $items['Credit'][$i];
                  }
                @endphp
                <tr>
                  @if ($i < $debit_count)
                    <td>{{ date('d/m/Y', strtotime($debit->date)) }}</td>
                    <td>{{ $debit->particular }}</td>
                    <td>{{ $debit->amount }}</td>
                  @else
                    <td></td>
                    <td></td>
                    <td></td>
                  @endif

                  @if ($i < $credit_count)
                    <td>{{ date('d/m/Y', strtotime($credit->date)) }}</td>
                    <td>{{ $credit->particular }}</td>
                    <td>{{ $credit->amount }}</td>
                  @else
                    <td></td>
                    <td></td>
                    <td></td>
                  @endif

                </tr>
              @endfor
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
